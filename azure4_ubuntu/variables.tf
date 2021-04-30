variable "my_rg_name" {
    default="alanlo-tf4-resource"
}
variable "my_user" {
    default="azureuser"
}
variable "my_key" {
    default="~/.ssh/id_rsa_azure.pub"
}
variable "my_ip" {
    default="59.102.50.152"
}
variable "vm_size" {
    #default="Standard_B1ls"
    default="Standard_D2a_v4"
}

variable "my_publisher" {
    default="Canonical"
}
variable "my_offer" {
    default="0001-com-ubuntu-server-focal"
}
variable "my_sku" {
    default="20_04-LTS"
}
variable "my_version" {
    default="latest"
}

variable "my_tags" {
    type=map(string)
}

variable "subscription_id" {
  type=string
}
variable "client_id" {
  type=string
}
variable "client_secret" {
  type=string
}
variable "tenant_id" {
  type=string
}
