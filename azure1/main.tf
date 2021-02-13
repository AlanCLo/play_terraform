terraform {
  required_version = ">= 0.11"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

variable "prefix" {
  default     = "alanlo-tf"
}

resource "azurerm_resource_group" "my_group" {
  name = "${var.prefix}-resources"
  location = "Australia Southeast"

  tags {
    Created = "2021-02-13T02:27:56.0373205Z"
  }
}





