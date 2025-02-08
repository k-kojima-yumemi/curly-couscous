terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

data "github_repository" "repo" {
  full_name = var.repo_full_name
}

output "repos" {
  // just for check
  value = data.github_repository.repo.name
}

resource "github_actions_secret" "identity_provider" {
  repository      = data.github_repository.repo.name
  secret_name     = "GCP_IDENTITY_PROVIDER"
  plaintext_value = var.workload_identity_pool_provider_name
}

resource "github_actions_secret" "service_account" {
  repository      = data.github_repository.repo.name
  secret_name     = "GCP_SERVICE_ACCOUNT"
  plaintext_value = var.service_account_email
}

resource "github_actions_secret" "iam_arn" {
  repository      = data.github_repository.repo.name
  secret_name     = "AWS_IAM_ROLE"
  plaintext_value = var.service_account_email
}
