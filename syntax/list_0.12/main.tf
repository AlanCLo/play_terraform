variable "my_list" {
  type    = list(string)
  default = ["a", "b", "c"]
}

variable "my_none" {
  type    = list(string)
  default = []
}

variable "my_single" {
  type    = string
  default = "d"
}

locals {
  my_list   = var.my_list
  my_none   = var.my_none
  my_single = [var.my_single]
}

output "my_list" {
  value = local.my_list
}

output "my_none" {
  value = local.my_none
}

output "my_single" {
  value = local.my_single
}

