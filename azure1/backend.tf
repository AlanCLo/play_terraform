# terraform {
#     backend "azurerm" {
#         resource_group_name = "alanlo-tf-resources"
#         storage_account_name = "alanloterraformstate"
#         container_name = "tfstate"
#         key = "azure1.terraform.tfstate"
#     }
# }