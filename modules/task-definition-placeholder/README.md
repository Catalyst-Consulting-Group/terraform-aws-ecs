# task-definition-placeholder

This module creates an opinionated `aws_ecs_task_definition` designed to be used for bootstrapping an AWS ECS Fargate service.

It uses [ecs-placeholder](https://github.com/Catalyst-Consulting-Group/ecs-placeholder) as the default image and configures it to publish on port `8080`.
Both of these options can be changed if desired.

## Usage

```
module "task_definition_placeholder" {
  source = "Catalyst-Consulting-Group/ecs/aws//modules/task-definition-placeholder"
  version = "~> 1.0"

  family = "example"

  task_role_arn           = aws_iam_role.task_role.arn
  task_execution_role_arn = aws_iam_role.task_execution_role.arn
}
```
