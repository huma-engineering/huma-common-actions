# huma-token-broker

A reusable composite GitHub Action that requests a scoped GitHub Installation Access Token from Huma internal Token Broker service using GitHub Actions OIDC authentication.

## How it works

1. The action requests an OIDC JWT from the GitHub Actions runtime, using the broker URL as the audience claim.
2. It sends the OIDC JWT along with the desired repositories and permissions to the Token Broker API.
3. The broker validates the caller's identity, checks policies, and returns a short-lived Installation Access Token scoped to the requested repositories and permissions.
4. The token is masked in logs and exposed as an action output.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `broker-url` | No | The base URL of the token broker (default: `https://github-token-broker.staging.huma.com`) |
| `repositories` | Yes | Comma-separated list of repositories to request access to (e.g., `huma-engineering/craft-tools,huma-engineering/shared-lib`) |
| `permissions` | No | JSON object of permission scopes (e.g., `{"contents": "read", "packages": "read"}`). Defaults to `{"contents": "read"}` when omitted. |

## Outputs

| Output | Description |
|--------|-------------|
| `token` | The scoped GitHub Installation Access Token |
| `expires-at` | ISO 8601 expiry timestamp of the token |

## Prerequisites

The calling workflow **must** grant OIDC token permissions to the job:

```yaml
permissions:
  id-token: write
```

Without this, the action will fail with a clear error message.

## Usage

### Single repository

`permissions` can be omitted when you only need repository read access; it defaults to `{"contents": "read"}`.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      id-token: write
      contents: read
    steps:
      - name: Get token for craft-tools
        id: token
        uses: huma-engineering/huma-common-actions/huma-token-broker@main
        with:
          repositories: huma-engineering/craft-tools

      - name: Clone craft-tools
        run: git clone https://x-access-token:${{ steps.token.outputs.token }}@github.com/huma-engineering/craft-tools.git
```

### Multiple repositories

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      id-token: write
      contents: read
    steps:
      - name: Get token for multiple repos
        id: multi-token
        uses: huma-engineering/huma-common-actions/huma-token-broker@main
        with:
          repositories: huma-engineering/craft-tools,huma-engineering/shared-lib
          permissions: '{"contents": "read", "packages": "read"}'

      - name: Clone craft-tools
        run: git clone https://x-access-token:${{ steps.multi-token.outputs.token }}@github.com/huma-engineering/craft-tools.git

      - name: Clone shared-lib
        run: git clone https://x-access-token:${{ steps.multi-token.outputs.token }}@github.com/huma-engineering/shared-lib.git
```

### Custom broker URL

```yaml
      - name: Get token from production broker
        id: token
        uses: huma-engineering/huma-common-actions/huma-token-broker@main
        with:
          broker-url: https://github-token-broker.prod.huma.com
          repositories: huma-engineering/craft-tools
```

### Using the token with npm

```yaml
      - name: Get token for npm packages
        id: npm-token
        uses: huma-engineering/huma-common-actions/huma-token-broker@main
        with:
          repositories: huma-engineering/shared-lib
          permissions: '{"packages": "read"}'

      - name: Install dependencies
        run: npm ci
        env:
          NODE_AUTH_TOKEN: ${{ steps.npm-token.outputs.token }}
```

## Error handling

The action will fail with a descriptive error in the following cases:

| Scenario | Error message |
|----------|---------------|
| Missing OIDC permissions | `OIDC token is not available. The calling workflow must set 'permissions: id-token: write'...` |
| OIDC token extraction failure | `Failed to extract OIDC token from GitHub Actions response.` |
| Broker returns non-2xx | `Token Broker returned HTTP <status>: <response body>` |
| Broker response missing token | `Broker response did not contain a valid token.` |

## Security

- The OIDC JWT and the broker token are both masked with `::add-mask::` so they never appear in workflow logs.
- Tokens are short-lived and scoped to only the requested repositories and permissions.
- No secrets need to be stored in the repository — authentication is handled entirely via OIDC.
