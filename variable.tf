variable "project_name" {
  type        = string
  description = "The project name for Google Cloud Project"
}

variable "project_region" {
  type        = string
  description = "Main region for this infrastructure"
}

variable "identity_pool_id" {
  type    = string
  default = "github-actions-openid-koma"
}

variable "iam_id" {
  type    = string
  default = "github-actions-koma"
}

variable "iam_name" {
  type    = string
  default = "GitHub Actions koma"
}

variable "github_owner" {
  type    = string
  default = "k-kojima-yumemi"
}

variable "github_repositories" {
  type = list(string)
  default = [
    "k-kojima-yumemi/curly-couscous",
  ]
}

variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type    = string
  default = ""
}
