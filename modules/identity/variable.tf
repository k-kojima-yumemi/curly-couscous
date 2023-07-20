variable "pool_id" {
  type        = string
  description = "The id of identity pool"
}

variable "provider_id" {
  type        = string
  default     = "token-actions-githubusercontent"
  description = "The id of identity pool provider"
}

variable "github_owner" {
  type = string
}
