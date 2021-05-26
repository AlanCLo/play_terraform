resource "random_string" "the_things" {
  count = local.num

  length  = 6
  lower   = true
  upper   = false
  number  = false
  special = false
}