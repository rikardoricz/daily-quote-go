resource "azurerm_resource_group" "dailyquote" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = var.environment
  }
}