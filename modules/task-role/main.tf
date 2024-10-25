data "aws_partition" "current" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

locals {
  source_account = data.aws_caller_identity.current.account_id

  source_arn = format(
    "arn:%s:ecs:%s:%s:*",
    data.aws_partition.current.partition,
    data.aws_region.current.name,
    data.aws_caller_identity.current.account_id,
  )
}

resource "aws_iam_role" "this" {
  name        = var.name
  name_prefix = var.name_prefix

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Condition = {
          ArnLike = {
            "aws:SourceArn" : local.source_arn
          }
          StringEquals = {
            "aws:SourceAccount" : local.source_account
          }
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "custom" {
  count = length(var.custom_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = var.custom_policy_arns[count.index]
}
