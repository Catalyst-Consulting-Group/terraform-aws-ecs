# task-role

This module creates an `aws_iam_role` with the appropriate `assume_role_policy` for ECS and the ability to append IAM policies.

## Usage

```
module "task_role" {
  source = "Catalyst-Consulting-Group/ecs/aws//modules/task-role"
  version = "~> 1.0"

  name = "foobar" # OR name_prefix = "foobar-"

  custom_policy_arns = [
    aws_iam_policy.foobar.arn,
  ]
}
```
