terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    // defined in local configuration file
  }
}

provider "google" {
  project = var.project_name
  region  = var.project_region
  default_labels = {
    terraform = true
    project   = "curly-couscous"
    region    = var.project_region
  }
}

provider "github" {
  owner = var.github_owner
  // Using token from gh command
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  default_tags {
    tags = {
      terraform = true
      project   = "curly-couscous"
      region    = var.aws_region
    }
  }
}
