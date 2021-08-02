variable "basic_bool" {
  description = "Change the value and see what tobool does"
  type        = string
  default     = "true"
}

locals {
  eval_bool = tobool(var.basic_bool)
}
