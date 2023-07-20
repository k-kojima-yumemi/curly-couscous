variable "github_repositories" {
  type = list(string)
}

variable "iam_name" {
  type = string
}

variable "iam_id" {
  type = string
}

variable "github_access_from" {
  type = string
}

variable "workload_identity_pool_name" {
  type = string
}
