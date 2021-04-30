terraform {
  required_version = ">= 0.12"
}

variable "basic_bool" {
  type = "string"
  default = "3"
}

locals {
  eval_bool = tobool(var.basic_bool)
}

output "hello_world" {
    value = "Hello world!"
}

output "bool_test" {
  value = local.eval_bool
}
