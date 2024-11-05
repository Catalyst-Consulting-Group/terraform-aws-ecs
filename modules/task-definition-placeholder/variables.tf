variable "family" {
  description = "(Required) The family name of the task definition"
  type        = string
  nullable    = false
}

variable "image" {
  description = "(Optional) The image to use"
  type        = string
  default     = "ghcr.io/catalyst-consulting-group/ecs-placeholder:latest"
  nullable    = false
}

variable "environment" {
  description = "(Optional) The environment variables to pass to the container"
  type = list(object({
    name  = string
    value = string
  }))
  default = [{
    name  = "NGINX_PORT"
    value = "8080"
  }]
  nullable = false
}

variable "container_name" {
  description = "(Optional) The name of the container. Defaults to the value of `family`."
  type        = string
  default     = null
  nullable    = true
}

variable "container_port" {
  description = "(Optional) The exposed port on the container"
  type        = number
  default     = 8080
  nullable    = false
}

variable "task_role_arn" {
  description = "(Required) The ARN of the IAM task role"
  type        = string
  nullable    = false
}

variable "task_execution_role_arn" {
  description = "(Required) The ARN of the IAM task execution role"
  type        = string
  nullable    = false
}

variable "tags" {
  description = "(Optional) A map of tags to add to resources"
  type        = map(string)
  default     = {}
  nullable    = false
}
