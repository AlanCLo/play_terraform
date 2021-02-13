output "frontend_id" {
  value = "${azurerm_subnet.my_subnet_frontend.id}"
}

output "backend_id" {
  value = "${azurerm_subnet.my_subnet_backend.id}"
}

output "dmz_id" {
  value = "${azurerm_subnet.my_subnet_dmz.id}"
}

output "project1_load_balancer_ip" {
    value = "${module.project1_instances.load_balancer_ip}"
}

# output "project2_load_balancer_ip" {
#     value = "${module.project2_instances.load_balancer_ip}"
# }

