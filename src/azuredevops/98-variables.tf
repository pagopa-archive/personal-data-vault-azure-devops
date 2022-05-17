variable "region" {
  type        = string
  description = "AWS default region"
  default     = "eu-south-1"
}

# git repo ms-person
variable "ms-person" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "pdv-ms-person"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
    }
    sonarcloud = {
      id                 = "64cadb57-185f-4e25-a3bc-1dd3310e7acf"
      organization       = "pagopa"
      service_connection = "SONARCLOUD-PERSON"
      project_key        = "pagopa_pdv-ms-person"
    }
  }
}

# MS git repo user-registry
variable "ms-user-registry" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "pdv-ms-user-registry"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
    }
    sonarcloud = {
      id                 = "8e72e090-b07e-4cc5-a28b-b7676a344530"
      organization       = "pagopa"
      service_connection = "SONARCLOUD-USER-REGISTRY"
      project_key        = "pagopa_pdv-ms-user-registry"
    }
  }
}

# MS git repo tests
variable "ms-esc-test" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "ecs-app-test"
      branch_name     = "refs/heads/main"
      pipelines_path  = "src/pipelines"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
    }
  }
}