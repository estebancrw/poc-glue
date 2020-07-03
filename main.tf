data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [var.iam_role_trusted_service]
    }
  }
}

data "aws_iam_policy" "policy" {
  arn = var.iam_policy_arn
}

resource "aws_iam_role" "role" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "role_policy" {
  role       = aws_iam_role.role.name
  policy_arn = data.aws_iam_policy.policy.arn
}
