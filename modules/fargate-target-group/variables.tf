variable "name" {
  description = "(Required) The name of the target group"
  type        = string
  nullable    = false
}

variable "port" {
  description = "(Required) The port to forward requests to"
  type        = number
  default     = 8080
  nullable    = false
}

variable "protocol" {
  description = "(Required) The protocol of the backend endpoint"
  type        = string
  default     = "HTTP"
  nullable    = false
}

variable "vpc_id" {
  description = "(Required) The ID of the VPC"
  type        = string
  nullable    = false
}

variable "deregistration_delay" {
  description = "(Optional) Amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds"
  type        = number
  default     = 5
  nullable    = false
}

variable "health_check_path" {
  description = "(Required, default: /health) The relative URL path to the health check endpoint"
  type        = string
  default     = "/health"
  nullable    = false
}

variable "health_check_port" {
  description = "(Optional) The port to use to connect with the target"
  type        = string
  default     = null
}

variable "health_check_matcher" {
  description = "(Required) The status code pattern for the health check endpoint"
  type        = string
  default     = "200"
  nullable    = false
}

variable "health_check_interval" {
  description = "(Optional) Approximate amount of time, in seconds, between health checks of an individual target"
  type        = number
  default     = 10
  nullable    = false
}

variable "health_check_healthy_threshold" {
  description = "(Optional) Number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = number
  default     = 2
  nullable    = false
}

variable "health_check_timeout" {
  description = "(Optional) Amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 5
  nullable    = false
}

variable "alb_listener_arn" {
  description = "(Required) The ARN of the ALB listener"
  type        = string
  nullable    = false
}

variable "host_headers" {
  description = "(Optional) The host header condition values for the listener rule"
  type        = list(string)
  default     = []
  nullable    = false
}

variable "path_patterns" {
  description = "(Optional) The path pattern values for the listener rule"
  type        = list(string)
  default     = []
  nullable    = false
}

variable "tags" {
  description = "(Optional) A map of tags to add to resources"
  type        = map(string)
  default     = {}
  nullable    = false
}
