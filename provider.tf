terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

  #  backend "gcs" {
  #    bucket = ""
  #    prefix = ""
  #  }
}

provider "google" {
  project = var.project_name
  region  = var.project_region
  zone    = var.project_zone
}

provider "github" {
  token = var.gh_token
  owner = var.github_owner
}
