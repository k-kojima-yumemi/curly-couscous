module "main_github_identity_pool" {
  source       = "./modules/identity"
  pool_id      = var.identity_pool_id
  github_owner = var.github_owner
}

module "main_service_account_github" {
  source                      = "./modules/iam"
  github_access_from          = var.github_owner
  github_repositories         = var.github_repositories
  iam_id                      = var.iam_id
  iam_name                    = var.iam_name
  workload_identity_pool_name = module.main_github_identity_pool.workload_identity_pool_name
}

module "github_secrets" {
  for_each                             = toset(var.github_repositories)
  source                               = "./modules/github_secret"
  repo_full_name                       = each.value
  service_account_email                = module.main_service_account_github.service_account_email
  workload_identity_pool_provider_name = module.main_github_identity_pool.workload_identity_pool_provider_name
  aws_iam_role_arn                     = module.main_service_account_github.aws_iam_role_arn
}
