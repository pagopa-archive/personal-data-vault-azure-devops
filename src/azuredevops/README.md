## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.63.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | = 0.1.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.63.0 |
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | = 0.1.8 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs_person_deploy"></a> [ecs\_person\_deploy](#module\_ecs\_person\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.5 |  |
| <a name="module_ecs_test"></a> [ecs\_test](#module\_ecs\_test) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.5 |  |
| <a name="module_ecs_tokenizer_deploy"></a> [ecs\_tokenizer\_deploy](#module\_ecs\_tokenizer\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.5 |  |
| <a name="module_ecs_user_registry_deploy"></a> [ecs\_user\_registry\_deploy](#module\_ecs\_user\_registry\_deploy) | git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.5 |  |

## Resources

| Name | Type |
|------|------|
| [azuredevops_project.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/project) | resource |
| [azuredevops_project_features.features](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/project_features) | resource |
| [azuredevops_serviceendpoint_aws.prod_serviceendpoint](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/serviceendpoint_aws) | resource |
| [azuredevops_serviceendpoint_aws.uat_serviceendpoint](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/serviceendpoint_aws) | resource |
| [azuredevops_serviceendpoint_github.github_pr](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/serviceendpoint_github) | resource |
| [azuredevops_serviceendpoint_github.github_ro](https://registry.terraform.io/providers/microsoft/azuredevops/0.1.8/docs/resources/serviceendpoint_github) | resource |
| [aws_secretsmanager_secret.devops](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.devops](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ms-esc-test"></a> [ms-esc-test](#input\_ms-esc-test) | n/a | `map` | <pre>{<br>  "pipeline": {<br>    "enable_code_review": true,<br>    "enable_deploy": true<br>  },<br>  "repository": {<br>    "branch_name": "refs/heads/main",<br>    "name": "ecs-app-test",<br>    "organization": "pagopa",<br>    "pipelines_path": "src/pipelines",<br>    "yml_prefix_name": null<br>  }<br>}</pre> | no |
| <a name="input_ms-person"></a> [ms-person](#input\_ms-person) | git repo ms-person | `map` | <pre>{<br>  "pipeline": {<br>    "enable_code_review": true,<br>    "enable_deploy": true<br>  },<br>  "repository": {<br>    "branch_name": "refs/heads/main",<br>    "name": "pdv-ms-person",<br>    "organization": "pagopa",<br>    "pipelines_path": ".devops",<br>    "yml_prefix_name": null<br>  }<br>}</pre> | no |
| <a name="input_ms-tokenizer"></a> [ms-tokenizer](#input\_ms-tokenizer) | git repo ms-person service | `map` | <pre>{<br>  "pipeline": {<br>    "enable_code_review": true,<br>    "enable_deploy": true<br>  },<br>  "repository": {<br>    "branch_name": "refs/heads/main",<br>    "name": "pdv-ms-tokenizer",<br>    "organization": "pagopa",<br>    "pipelines_path": ".devops",<br>    "yml_prefix_name": null<br>  }<br>}</pre> | no |
| <a name="input_ms-user-registry"></a> [ms-user-registry](#input\_ms-user-registry) | n/a | `map` | <pre>{<br>  "pipeline": {<br>    "enable_code_review": true,<br>    "enable_deploy": true<br>  },<br>  "repository": {<br>    "branch_name": "refs/heads/main",<br>    "name": "pdv-ms-user-registry",<br>    "organization": "pagopa",<br>    "pipelines_path": ".devops",<br>    "yml_prefix_name": null<br>  }<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS default region | `string` | `"eu-south-1"` | no |

## Outputs

No outputs.
