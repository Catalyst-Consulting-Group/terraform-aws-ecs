variable "name" {
  description = "(Conditional) The name of the role. Conflits with `name_prefix`."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "(Conditional) The name prefix of the role. Conflits with `name`."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional, Default: `{}`) A map of tags to add to the role"
  type        = map(string)
  default     = {}
}

variable "custom_policy_arns" {
  description = "(Optional, Default: `[]`) A list of IAM Policy ARNs to associate with the role"
  type        = list(string)
  default     = []
}
