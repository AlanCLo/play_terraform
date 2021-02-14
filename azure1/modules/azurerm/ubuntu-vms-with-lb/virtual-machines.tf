resource "azurerm_availability_set" "frontend" {
  name                        = "${var.prefix}-f-availability-set"
  location                    = var.location
  resource_group_name         = var.resource_group
  platform_fault_domain_count = "2"
}

## I wanted to check out what was on the VM so enable this if needed.
# resource "azurerm_public_ip" "tmpssh" {
#     count                        = "${var.instance_count}"
#     name                         = "${var.prefix}-public-ip-ssh-${count.index}"
#     location                     = "${var.location}"
#     resource_group_name          = "${var.resource_group}"
#     allocation_method = "Dynamic"
# }

## My version of azurerm provider hated this
# resource "azurerm_storage_container" "frontend" {
#     count                 = "${var.instance_count}"
#     name                  = "${var.prefix}-f-storage-container-${count.index}"
#     resource_group_name   = "${var.resource_group}"
#     storage_account_name  = "${azurerm_storage_account.frontend.name}"
#     container_access_type = "private"
# }

resource "azurerm_network_interface" "frontend" {
  count               = var.instance_count
  name                = "${var.prefix}-f-interface-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "${var.prefix}-f-ip-${count.index}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "dynamic"
    ### This from the tutorial doesn't work with the azurerm provider I got
    #load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.frontend.id}"]
    ### ^^^ Using azurerm_network_interface_backend_address_pool_association
    #
    ### For when I want to ssh to this without making a bastion
    #public_ip_address_id                    = "${element(azurerm_public_ip.tmpssh.*.id, count.index)}"
  }
}

### Apparently I need this
### https://registry.terraform.io/providers/hashicorp/azurerm/1.44.0/docs/resources/network_interface_backend_address_pool_association
resource "azurerm_network_interface_backend_address_pool_association" "frontend" {
  count                   = var.instance_count
  network_interface_id    = element(azurerm_network_interface.frontend.*.id, count.index)
  ip_configuration_name   = "${var.prefix}-f-ip-${count.index}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.frontend.id
}

resource "azurerm_virtual_machine" "frontend" {
  count                 = var.instance_count
  name                  = "${var.prefix}-f-instance-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [element(azurerm_network_interface.frontend.*.id, count.index)]
  vm_size               = var.instance_size
  availability_set_id   = azurerm_availability_set.frontend.id

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "${var.prefix}-f-disk-${count.index}"

    #vhd_uri       = "${azurerm_storage_account.frontend.primary_blob_endpoint}${element(azurerm_storage_container.frontend.*.name, count.index)}/mydisk.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  # Optional data disks
  # storage_data_disk {
  #     name          = "datadisk0"
  #     vhd_uri       = "${azurerm_storage_account.frontend.primary_blob_endpoint}${element(azurerm_storage_container.frontend.*.name, count.index)}/datadisk0.vhd"
  #     disk_size_gb  = "1023"
  #     create_option = "Empty"
  #     lun           = 0
  # }

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  os_profile {
    computer_name  = "${var.prefix}-f-instance-${count.index}"
    admin_username = var.instance_user
    admin_password = var.instance_password
    custom_data    = base64encode(file("${path.module}/templates/${var.custom_data_file}"))
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

