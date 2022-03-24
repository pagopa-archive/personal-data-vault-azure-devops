# Pivate Data Vault Azure Devops project

This repo template allows you to create a repo for your project pipelines

## How to use this template

You need to add to secret manger a secret named **devops** with the following secrets.

{
  "github_ro_token": "<read only github token>",
  "aws_iac_access_key_id": "<aws Deploy iam user access id>",
  "aws_iac_secret_access_key": "<aws Deploy iam user access key>",
  "github_pr_token": "<github pr token>"
}
## Github bot

Use your github bot to generate the token to interact with your repo.

And don't forgot to associate to your repo as ADMIN, without this is impossibile to use the pipelines

## Precommit check

Check your code before commit.

<https://github.com/antonbabenko/pre-commit-terraform#how-to-install>

```sh
pre-commit run -a
```
