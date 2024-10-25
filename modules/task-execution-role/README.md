# task-execution-role

This module creates an `aws_iam_role` with the appropriate `assume_role_policy` and default `AmazonECSTaskExecutionRolePolicy` attached for ECS. It also has the ability to append custom IAM policies.

## Usage

```
module "task_role" {
  source = "Catalyst-Consulting-Group/ecs/aws//modules/task-execution-role"
  version = "~> 1.0"

  name = "foobar" # OR name_prefix = "foobar-"

  # Override to exclude the `AmazonECSTaskExecutionRolePolicy` from being attached by default
  # Useful in cases where you want to ensure the task has very limited permissions
  attach_default_policy = false

  custom_policy_arns = [
    aws_iam_policy.foobar.arn,
  ]
}
```
