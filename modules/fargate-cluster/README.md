# fargate-cluster

This module creates an opinionated `aws_ecs_cluster` designed for use with AWS Fargate.

## Usage

```
module "cluster" {
  source = "Catalyst-Consulting-Group/ecs/aws//modules/fargate-cluster"
  version = "~> 1.0"

  name = "example-cluster"
}
```
