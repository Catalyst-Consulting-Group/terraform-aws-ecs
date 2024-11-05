resource "aws_lb_target_group" "this" {
  name                 = var.name
  port                 = var.port
  protocol             = var.protocol
  target_type          = "ip"
  deregistration_delay = var.deregistration_delay

  vpc_id = var.vpc_id

  health_check {
    path              = var.health_check_path
    port              = var.health_check_port
    matcher           = var.health_check_matcher
    interval          = var.health_check_interval
    healthy_threshold = var.health_check_healthy_threshold
    timeout           = var.health_check_timeout
  }

  tags = var.tags
}

resource "aws_lb_listener_rule" "rule" {
  listener_arn = var.alb_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  dynamic "condition" {
    for_each = length(var.host_headers) > 0 ? [1] : []
    content {
      host_header {
        values = var.host_headers
      }
    }
  }

  dynamic "condition" {
    for_each = length(var.path_patterns) > 0 ? [1] : []
    content {
      path_pattern {
        values = var.path_patterns
      }
    }
  }

  tags = var.tags
}
