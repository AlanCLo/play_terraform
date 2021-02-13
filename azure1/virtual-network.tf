resource "azurerm_virtual_network" "my_vn" {
  name = "${var.prefix}-vn"
  address_space = ["10.0.0.0/16"]
  location = "${azurerm_resource_group.my_group.location}"
  resource_group_name = "${azurerm_resource_group.my_group.name}"

  tags {
    Created  = "2021-02-13T02:46:42.3440273Z"

  }
}

resource "azurerm_subnet" "my_subnet_frontend" {
  name = "${var.prefix}-frontend"
  resource_group_name = "${azurerm_resource_group.my_group.name}"
  virtual_network_name = "${azurerm_virtual_network.my_vn.name}"
  address_prefix = "10.0.1.0/24"
}

resource "azurerm_subnet" "my_subnet_backend" {
  name = "${var.prefix}-backend"
  resource_group_name = "${azurerm_resource_group.my_group.name}"
  virtual_network_name = "${azurerm_virtual_network.my_vn.name}"
  address_prefix = "10.0.2.0/24"
}

resource "azurerm_subnet" "my_subnet_dmz" {
  name = "${var.prefix}-dmz"
  resource_group_name = "${azurerm_resource_group.my_group.name}"
  virtual_network_name = "${azurerm_virtual_network.my_vn.name}"
  address_prefix = "10.0.3.0/24"
}


