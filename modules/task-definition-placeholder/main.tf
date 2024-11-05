resource "aws_ecs_task_definition" "this" {
  family       = var.family
  network_mode = "awsvpc"
  cpu          = "256"
  memory       = "512"

  task_role_arn      = var.task_role_arn
  execution_role_arn = var.task_execution_role_arn

  container_definitions = jsonencode([
    {
      name      = coalesce(var.container_name, var.family)
      image     = var.image
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
        },
      ]
      environment = var.environment
    },
  ])

  tags = var.tags
}
