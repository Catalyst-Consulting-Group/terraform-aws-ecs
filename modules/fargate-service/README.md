# fargate-service

This module creates an opinionated `aws_ecs_service` designed for use with AWS Fargate.

The `initial_task_definition` is used to bootstrap the service and will be ignored (along with `desired_count`) during subsequent deployments.

## Usage

```
module "service" {
  source = "Catalyst-Consulting-Group/ecs/aws//modules/fargate-service"
  version = "~> 1.0"

  name       = "example"
  cluster_id = aws_ecs_cluster.example.id

  initial_task_definition = aws_ecs_task_definition.example.arn

  load_balancers = [
    {
      target_group_arn = aws_lb_target_group.example.arn
      container_name   = "example"
      container_port   = 8080
    }
  ]

  subnets = [
    # Subnet IDs
  ]

  security_groups = [
    # Security Group IDs
  ]
}
```
