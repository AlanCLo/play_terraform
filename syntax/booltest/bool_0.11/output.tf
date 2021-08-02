output "my_bool" {
  value = "${var.my_bool}"
}

output "eval_bool" {
  value = "${local.my_bool}"
}
