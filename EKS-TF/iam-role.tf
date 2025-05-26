data "aws_iam_policy_document" "s3_dynamodb_access" {
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::my-eks-devsecops-santhosh-2025",
      "arn:aws:s3:::my-eks-devsecops-santhosh-2025/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]
    resources = [
      "arn:aws:dynamodb:ap-south-1:*:table/terraform-lock"
    ]
  }
}

resource "aws_iam_policy" "eks_backend_policy" {
  name   = "eks-backend-policy"
  policy = data.aws_iam_policy_document.s3_dynamodb_access.json
}

