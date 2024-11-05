output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.this.arn
}

output "lb_listener_rule_arn" {
  description = "The ARN of the listener rule"
  value       = aws_lb_listener_rule.rule.arn
}
