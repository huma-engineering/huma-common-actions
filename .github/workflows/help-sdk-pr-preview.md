<!-- markdownlint-disable MD041 -->
Hey!👋 It's *github-actions[bot]* speaking!

I can build and deploy your application, connect it to a database and object storage, and give you a preview URL.💡

I understand the following commands to manage PR previews:

- `/deploy [flags]` deploys a preview of the current PR using selected database backup to a temporary Kubernetes namespace

  Flags:

  - `--env=[dev(default)|qa]` *(optional)* selects between the "dev" or "QA" as a source for a database and  storage clone jobs, the default is "dev" if this flag omitted
  - `--mongodb=[kubedb(default)|atlas]` *(optional)* selects between KubeDB (inside K8s cluster) and Atlas Cloud providers for temporary database, the default is KubeDB if this flag omitted
  - `--storage=[s3(default)|gcs]` *(optional)* selects between GCS or S3 bucket providers for temporary storage, the default is S3 if this flag omitted
  - `--db-full` *(optional)* restores the database backup with the "auditlog" and "deploymentrevision" collections
  - `--update-chart` *(optional)* deploys a new temporary helm chart version, built from your top commit

- `/rebuild [--update-chart]` rebuilds and deploys workload containers, reusing the attached DB and storage.
    Use it to redeploy your top commit or to check out a recent Clinician Portal image.
  - flag `--update-chart` *(optional)* deploys a new temporary helm chart version, built from your top commit
- `/run-migration` finds migrations in the “migrations” folder and applies them if needed.
- `/destroy` removes a deployment and the attached DB and storage.

You can find the complete documentation on [Pull Request Preview Self-Service for Huma Server SDK User's Manual](https://humatherapeutics.atlassian.net/l/c/6fowL0Xo) in Confluence.
