resource "google_iam_workload_identity_pool" "pool" {
  workload_identity_pool_id = var.pool_id
  description               = "OpenID Connection"
  display_name              = var.pool_id
  timeouts {}
}

output "workload_identity_pool_name" {
  value = google_iam_workload_identity_pool.pool.name
}

resource "google_iam_workload_identity_pool_provider" "gh_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  display_name                       = "GitHub Identity Provider"
  disabled                           = false
  oidc {
    issuer_uri        = "https://token.actions.githubusercontent.com"
    allowed_audiences = []
  }
  attribute_mapping = {
    "google.subject"       = "assertion.sub",
    "attribute.actor"      = "assertion.actor",
    "attribute.repository" = "assertion.repository",
  }
  attribute_condition = "attribute.actor == '${var.github_owner}'"
  timeouts {}
}

output "workload_identity_pool_provider_name" {
  value = google_iam_workload_identity_pool_provider.gh_provider.name
}
