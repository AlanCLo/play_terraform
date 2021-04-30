provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "mon-rules-example"
  location = "Australia Southeast"
}

resource "azurerm_monitor_action_group" "example" {
  name                = "example-action-group"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "short1"
}

resource "azurerm_monitor_action_rule_action_group" "example" {
  name                = "example-amar"
  resource_group_name = azurerm_resource_group.example.name
  action_group_id     = azurerm_monitor_action_group.example.id

  scope {
    type         = "ResourceGroup"
    resource_ids = [azurerm_resource_group.example.id]
  }

  tags = {
    foo = "bar"
  }
}
