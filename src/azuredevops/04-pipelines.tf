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