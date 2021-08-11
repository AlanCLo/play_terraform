locals {
  my_list  = ["a", "b", "c"]
  my_list2 = tolist(local.my_list)
}

output "my_list" {
  value = local.my_list
}

output "my_list2" {
  value = local.my_list2
}

