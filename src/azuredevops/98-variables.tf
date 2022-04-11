variable "region" {
  type        = string
  description = "AWS default region"
  default     = "eu-south-1"
}

# git repo ms-person service
variable "ms-tokenizer" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "pdv-ms-tokenizer"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      yml_prefix_name = null
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
    }
  }
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
  }
}