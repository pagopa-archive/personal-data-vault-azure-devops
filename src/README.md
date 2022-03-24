# Azure DevOps

This folder is for managing **Azure DevOps** projects and pipelines.

## Requirements

### 1. terraform

In order to manage the suitable version of terraform it is strongly recommended to install the following tool:

- [tfenv](https://github.com/tfutils/tfenv): **Terraform** version manager inspired by rbenv.

Once these tools have been installed, install the terraform version shown in:

- .terraform-version

After installation install terraform:

```sh
tfenv install
```

### 3. Azure DevOps Personal Access Token

In order to authenticate to Azure DevOps ad manage pipelines you need to create and set a Personal Access Token.

- [Azure DevOps Personal Access Token](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate)

After create your token export it, for example in your bash_profile

```sh
# .bash_profile
export AZDO_ORG_SERVICE_URL="https://dev.azure.com/pagopa-io"
export AZDO_PERSONAL_ACCESS_TOKEN="__YOUR_PERSONAL_ACCESS_TOKEN__"
```

AZDO_ORG_SERVICE_URL can be with `pagopa-io` or the new `pagopaspa`


⚠️ **Very Important**

Before apply any changes be sure that permissions on github repo are set as follow:

1. user `pagopa-github-bot` -> Role: admin

### Apply changes

To apply changes follow the standard terraform lifecycle once the code in this repository has been changed:

```sh
az account set --subscription PROD-IO

terraform init

terraform plan

terraform apply
```
