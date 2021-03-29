variable "my_rg_name" {
    default="alanlo-tf5-resource"
}
variable "my_user" {
    default="azureuser"
}
variable "my_pass" {
    type="string"
}
variable "my_ip" {
    default="59.102.50.152"
}
variable "vm_size" {
    #default="Standard_B1ls"
    #default="Standard_D2a_v4"
    default="Standard_F2"
}

variable "my_publisher" {
    default="MicrosoftWindowsServer"
}
variable "my_offer" {
    default="WindowsServer"
}
variable "my_sku" {
    default="2016-Datacenter"
}
variable "my_version" {
    default="latest"
}

variable "my_tags" {
    type=map(string)
}
