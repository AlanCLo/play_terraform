module "project1_instances" {
  source            = "./modules/azurerm/ubuntu-vms-with-lb"
  prefix            = "alanacme"
  resource_group    = azurerm_resource_group.my_group.name
  location          = azurerm_resource_group.my_group.location
  subnet_id         = azurerm_subnet.my_subnet_frontend.id
  instance_count    = var.arm_frontend_instances
  instance_size     = "Standard_A0"
  instance_user     = var.arm_admin_user
  instance_password = var.arm_vm_admin_password
  custom_data_file  = "myapp.sh"
}

# module "project2_instances" {
#     source            = "./modules/azurerm/ubuntu-vms-with-lb"
#     prefix            = "acme2"
#     resource_group    = "${azurerm_resource_group.my_group.name}"
#     location          = "${azurerm_resource_group.my_group.location}"
#     subnet_id         = "${azurerm_subnet.my_subnet_frontend.id}"
#     instance_count    = "${var.arm_frontend_instances}"
#     instance_size     = "Standard_A2"
#     instance_user     = "${var.arm_admin_user}"
#     instance_password = "${var.arm_vm_admin_password}"
#     custom_data_file = "myapp.sh"
# }
