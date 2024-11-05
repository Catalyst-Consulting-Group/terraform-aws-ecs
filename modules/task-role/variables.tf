variable "name" {
  description = "(Conditional) The name of the role. Conflits with `name_prefix`."
  type        = string
  default     = null
  nullable    = true
}

variable "name_prefix" {
  description = "(Conditional) The name prefix of the role. Conflits with `name`."
  type        = string
  default     = null
  nullable    = true
}

variable "tags" {
  description = "(Optional) A map of tags to add to resources"
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "custom_policy_arns" {
  description = "(Optional) A list of IAM Policy ARNs to associate with the role"
  type        = list(string)
  default     = []
  nullable    = false
}
