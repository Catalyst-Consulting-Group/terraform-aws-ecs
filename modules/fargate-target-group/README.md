# fargate-target-group

This module creates an opinionated `aws_lb_target_group` and `aws_lb_listener_rule` for use with AWS ECS Fargate services.

## Usage

```
module "fargate_target_group" {
  source = "Catalyst-Consulting-Group/ecs/aws//modules/fargate-target-group"
  version = "~> 1.0"

  name         = "example"
  host_headers = ["example.foobar.com"]

  vpc_id           = aws_vpc.example.id
  alb_listener_arn = aws_lb_listener.example.arn
}
```
