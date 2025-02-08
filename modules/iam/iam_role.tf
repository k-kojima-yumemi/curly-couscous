resource "aws_iam_role" "account" {
  name               = var.iam_id
  description        = var.iam_name
  assume_role_policy = data.aws_iam_policy_document.account_assume.json
}

data "aws_iam_policy_document" "account_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["accounts.google.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "accounts.google.com:aud"
      values   = [google_service_account.account.unique_id]
    }
  }
}
