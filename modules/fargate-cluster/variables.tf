variable "name" {
  description = "(Required) The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  nullable    = false
}

variable "container_insights" {
  description = "(Optional) The CloudWatch Container Insights setting for the cluster. Valid values: 'enabled', 'disabled' (or `null` to use account default)"
  type        = string
  nullable    = true
  default     = null
}

variable "tags" {
  description = "(Optional) A map of tags to add to the cluster"
  type        = map(string)
  default     = {}
}
