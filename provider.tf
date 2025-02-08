terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    github = {
      source  = "integrations/github"
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
}

provider "github" {
  owner = var.github_owner
  // Using token from gh command
}
