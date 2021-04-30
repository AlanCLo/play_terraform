output "my_test" {
  description = "Test joing string"
  value       = local.test_join_string
}


output "mapmap" {
  description = "Test converting lists to map"
  value       = local.convert_list_to_map
}
