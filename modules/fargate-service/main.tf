resource "aws_ecs_service" "this" {
  name    = var.name
  cluster = var.cluster_id

  launch_type      = "FARGATE"
  platform_version = var.platform_version

  task_definition = var.initial_task_definition
  desired_count   = 1

  enable_execute_command = var.enable_execute_command
  force_new_deployment   = var.force_new_deployment

  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent

  dynamic "load_balancer" {
    for_each = { for lb in var.load_balancers : lb.target_group_arn => lb }

    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
  }

  tags = var.tags

  lifecycle {
    # The task definition and desired count are expected to be updated externally
    ignore_changes = [
      task_definition,
      desired_count,
    ]
  }
}
