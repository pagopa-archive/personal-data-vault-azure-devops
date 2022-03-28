
locals {
  azure_devops_org = "pagopaspa"
}

resource "azuredevops_project" "this" {
  name               = "personal-data-vault-projects"
  description        = "DevOps project for user data vault."
  visibility         = "public"
  version_control    = "Git"
  work_item_template = "Basic"
}

resource "azuredevops_project_features" "features" {
  project_id = azuredevops_project.this.id
  features = {
    "boards"       = "disabled"
    "repositories" = "disabled"
    "pipelines"    = "enabled"
    "testplans"    = "disabled"
    "artifacts"    = "disabled"
  }
}