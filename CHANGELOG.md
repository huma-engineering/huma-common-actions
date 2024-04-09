# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this
project adheres to [Semantic Versioning](http://semver.org/).


## [Unreleased]


## [v1.3.0] - 2024-04-09

FEATURES:

- [HCB-697] update setup-helmfile node20, helmfile v0.161.0, helm v3.14.0


## [v1.2.1] - 2023-08-03

ENHANCEMENTS:

- Version keeping and the changelog generation
- [HCB-652] helmfile diff plugin show only actual changes like "git diff" does


## [v1.2.0] - 2023-07-04

BUG FIXES:

- [HCB-652] Fix the GitHub action helmfile-apply has Argument list too long
- [HCB-642] Fix GitHub workflow fo DCT installing helm-diff plugin twice

TESTS:

- [HCB-642] Fix Test helmfile-pr action installing helm-diff plugin twice

CI:

- Dependabot version updates


## [v1.1.1] - 2023-05-15

FEATURES:

- Upgrading openvpn helper action


## [v1.1.0] - 2022-11-08

BUG FIXES:

- Fix the comment-id output issue on first create option

DOCS:

- Updating README for actions


## [v1.0.0] - 2022-11-07

FEATURES:

- Adding helmfile PR and apply
- Adding openvpn for Perimeter81 and skeleton


## 0.1 - 2022-01-09


[Unreleased]: https://github.com/huma-engineering/huma-common-actions/compare/v1.3.0...HEAD
[v1.3.0]: https://github.com/huma-engineering/huma-common-actions/compare/v1.2.1...v1.3.0
[v1.2.1]: https://github.com/huma-engineering/huma-common-actions/compare/v1.2.0...v1.2.1
[v1.2.0]: https://github.com/huma-engineering/huma-common-actions/compare/v1.1.1...v1.2.0
[v1.1.1]: https://github.com/huma-engineering/huma-common-actions/compare/v1.1.0...v1.1.1
[v1.1.0]: https://github.com/huma-engineering/huma-common-actions/compare/v1.0.0...v1.1.0
[v1.0.0]: https://github.com/huma-engineering/huma-common-actions/compare/0.1...v1.0.0
[HCB-697]: https://medopadteam.atlassian.net/browse/HCB-697
[HCB-652]: https://medopadteam.atlassian.net/browse/HCB-652
[HCB-642]: https://medopadteam.atlassian.net/browse/HCB-642
