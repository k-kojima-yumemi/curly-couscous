variable "repo_full_name" {
  type = string
}

variable "workload_identity_pool_provider_name" {
  type = string
  validation {
    condition     = var.workload_identity_pool_provider_name != ""
    error_message = "workload_identity_pool_provider_name must not be empty"
  }
}

variable "service_account_email" {
  type = string
  validation {
    condition     = var.service_account_email != ""
    error_message = "service_account_email must not be empty"
  }
}

variable "aws_iam_role_arn" {
  type = string
  validation {
    condition     = var.aws_iam_role_arn != ""
    error_message = "aws_iam_role_arn must not be empty"
  }
}
