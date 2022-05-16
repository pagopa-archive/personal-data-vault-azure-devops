locals {
  ms_person_app = {
    docker_image = "ms-person"
  }

  ms_user_resistry_app = {
    docker_image = "ms-user-registry"
  }

  ms_poc_app = {
    docker_image = "ms-poc"
  }
}




# MS Person
module "ecs_person_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.5"

  project_id                   = azuredevops_project.this.id
  repository                   = var.ms-person.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.github_pr.id

  ci_trigger_use_yaml = true

  variables        = local.ms_person_app
  variables_secret = {}

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.github_ro.id,
    azuredevops_serviceendpoint_aws.uat_serviceendpoint.id,
    azuredevops_serviceendpoint_aws.prod_serviceendpoint.id,
  ]
}

## code review.
module "pipeline-person_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.0.5"

  project_id                   = azuredevops_project.this.id
  repository                   = var.ms-person.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.github_pr.id

  pull_request_trigger_use_yaml = true

  variables = {
    sonarcloud_service_conn = var.ms-person.sonarcloud.service_connection
    sonarcloud_org          = var.ms-person.sonarcloud.organization
    sonarcloud_project_key  = var.ms-person.sonarcloud.project_key
    sonarcloud_project_name = join("_", [
      var.ms-person.sonarcloud.organization,
      var.ms-person.sonarcloud.project_key
    ])
  }

  variables_secret = {}

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.github_ro.id,
    var.ms-person.sonarcloud.id,
  ]
}


# MS User registry

module "ecs_user_registry_deploy" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.5"

  project_id                   = azuredevops_project.this.id
  repository                   = var.ms-user-registry.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.github_pr.id

  ci_trigger_use_yaml = true

  variables        = local.ms_user_resistry_app
  variables_secret = {}

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.github_ro.id,
    azuredevops_serviceendpoint_aws.uat_serviceendpoint.id,
    azuredevops_serviceendpoint_aws.prod_serviceendpoint.id,
  ]
}

## Code review
module "pipeline-user_registry_code_review" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_code_review?ref=v2.0.5"

  project_id                   = azuredevops_project.this.id
  repository                   = var.ms-user-registry.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.github_pr.id

  pull_request_trigger_use_yaml = true

  variables = {
    sonarcloud_service_conn = var.ms-user-registry.sonarcloud.service_connection
    sonarcloud_org          = var.ms-user-registry.sonarcloud.organization
    sonarcloud_project_key  = var.ms-user-registry.sonarcloud.project_key
    sonarcloud_project_name = join("_", [
      var.ms-user-registry.sonarcloud.organization, var.ms-user-registry.sonarcloud.project_key
    ])
  }

  variables_secret = {}

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.github_ro.id,
    var.ms-user-registry.sonarcloud.id,
  ]
}


# MS POC go webapp

module "ecs_test" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=v2.0.5"

  project_id                   = azuredevops_project.this.id
  repository                   = var.ms-esc-test.repository
  github_service_connection_id = azuredevops_serviceendpoint_github.github_pr.id

  ci_trigger_use_yaml = true

  variables        = local.ms_poc_app
  variables_secret = {}

  service_connection_ids_authorization = [
    azuredevops_serviceendpoint_github.github_ro.id,
    azuredevops_serviceendpoint_aws.uat_serviceendpoint.id,
    azuredevops_serviceendpoint_aws.prod_serviceendpoint.id,
  ]
}
