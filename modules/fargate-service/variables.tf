variable "name" {
  description = "(Required) The name of the ECS service"
  type        = string
}

variable "cluster_id" {
  description = "(Required) The ID of the ECS cluster"
  type        = string
}

variable "platform_version" {
  description = "(Optional) The platform version on which to run your service"
  type        = string
  default     = "LATEST"
}

variable "initial_task_definition" {
  description = "(Required) The family and revision (`family:revision`) or full ARN of the task definition that you want to bootstrap your service with"
  type        = string
}

variable "enable_execute_command" {
  description = "(Optional) Controls the `enable_execute_command` option for the service"
  type        = bool
  default     = false
}

variable "force_new_deployment" {
  description = "(Optional) Controls the `force_new_deployment` option for the service"
  type        = bool
  default     = false
}

variable "load_balancers" {
  description = "(Optional) A list of load balancer mappings to associate with the service"
  type = list(object({
    target_group_arn = string
    container_name   = string
    container_port   = number
  }))
  default = []
}

variable "subnets" {
  description = "(Required) A list of subnet IDs to launch tasks in"
  type        = list(string)
}

variable "security_groups" {
  description = "(Optional) A list of security group IDs for the tasks"
  type        = list(string)
  default     = []
}

variable "deployment_maximum_percent" {
  description = "(Optional) Upper limit (as a percentage of the service's `desiredCount`) of the number of running tasks that can be running in a service during a deployment"
  type        = number
  default     = 200
}

variable "deployment_minimum_healthy_percent" {
  description = "(Optional) Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
  type        = number
  default     = 100
}

variable "tags" {
  description = "(Optional) A map of tags to add to the service"
  type        = map(string)
  default     = {}
}
