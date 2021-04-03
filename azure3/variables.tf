variable "my_rg_name" {
    default="alanlo-tf3-resource"
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
    default="Standard_B1ls"
}

variable "my_publisher" {
    default="RedHat"
}
variable "my_offer" {
    default="RHEL"
}
variable "my_sku" {
    default="7.3"
}
variable "my_version" {
    default="latest"
}

variable "my_tags" {
    type=map(string)
}
