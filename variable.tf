variable "project_name" {
  type    = string
  default = ""
}

variable "project_region" {
  type    = string
  default = ""
}

variable "project_zone" {
  type    = string
  default = ""
}

variable "gh_token" {
  type = string
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
