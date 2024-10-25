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

  # This is the AWS managed policy that is required for ECS tasks to run correctly
  # See: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html
  default_policy_arn = format(
    "arn:%s:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
    data.aws_partition.current.partition,
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

resource "aws_iam_role_policy_attachment" "default" {
  count = var.attach_default_policy ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = local.default_policy_arn
}

resource "aws_iam_role_policy_attachment" "custom" {
  count = length(var.custom_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = var.custom_policy_arns[count.index]
}
