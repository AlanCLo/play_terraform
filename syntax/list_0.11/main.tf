variable "my_list" {
  type    = "list"
  default = ["a", "b", "c"]
}

variable "my_single" {
  type    = "string"
  default = "d"
}

variable "my_none" {
  type    = "list"
  default = []
}

locals {
  my_list   = ["${var.my_list}"]
  my_single = ["${var.my_single}"]
  my_none   = ["${var.my_none}"]
}

output "my_list" {
  value = "${local.my_list}"
}

output "my_single" {
  value = "${local.my_single}"
}

output "my_none" {
  value = "${local.my_none}"
}
