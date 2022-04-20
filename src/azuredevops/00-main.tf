terraform {
  required_version = ">= 1.1.5"

  backend "s3" {
    bucket         = "terraform-backend-4337"
    key            = "uat/devops/webapp/tfstate"
    region         = "eu-south-1"
    dynamodb_table = "terraform-lock"
    profile        = "ppa-personal-data-vault-uat"
  }

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "= 0.1.8"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.63.0"
    }

  }
}

provider "aws" {
  profile = "ppa-personal-data-vault-uat"
  region  = var.region
}

provider "aws" {
  alias   = "prod"
  profile = "ppa-personal-data-vault-prod"
  region  = var.region
}