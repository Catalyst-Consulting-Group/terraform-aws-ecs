resource "aws_ecs_cluster" "this" {
  name = var.name

  dynamic "setting" {
    for_each = var.container_insights != null ? [1] : []
    content {
      name  = "containerInsights"
      value = var.container_insights
    }
  }

  tags = var.tags
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name = aws_ecs_cluster.this.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
  }
}
