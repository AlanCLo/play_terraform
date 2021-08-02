resource "null_resource" "nothing" {
  count = 0
}

output "nothing_id" {
  value = "${join(",", null_resource.nothing.*.id)}"
}
