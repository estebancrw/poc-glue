variable "iam_policy_arn" {
  description = "ARN of the IAM Policy"
  type        = string

  default = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

variable "iam_role_name" {
  description = "Name of the IAM Role"
  type        = string

  default = "glueService"
}

variable "iam_role_trusted_service" {
  description = "IAM Role principal service identifier"
  type        = string

  default = "glue.amazonaws.com"
}

variable "tags" {
  description = "Map of tags for resources"
  type        = map(string)

  default = {
    owner = "esteban"
  }
}
