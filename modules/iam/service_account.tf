resource "google_service_account" "account" {
  account_id   = var.iam_id
  display_name = var.iam_name
  description  = "Access from GitHub Actions(${var.github_access_from})"
  disabled     = false
  timeouts {}
}

output "service_account_email" {
  value = google_service_account.account.email
}

resource "google_service_account_iam_policy" "policy" {
  policy_data        = data.google_iam_policy.policy.policy_data
  service_account_id = google_service_account.account.name
}

data "google_iam_policy" "policy" {
  binding {
    members = [
      for s in var.github_repositories :
      "principalSet://iam.googleapis.com/${var.workload_identity_pool_name}/attribute.repository/${s}"
    ]
    role = "roles/iam.workloadIdentityUser"
  }
}
