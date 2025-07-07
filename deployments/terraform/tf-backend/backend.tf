provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfstate" {
  location = var.location
  name     = var.resource_group_name 
}

resource "azurerm_storage_account" "tfstate" {
  name                     = var.storage_account_name_backend
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.storage_container_name_backend
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = var.container_access_type
}

output "resource_group_name" {
  value = azurerm_resource_group.tfstate.name
}

output "storage_account_name" {
  value = azurerm_storage_account.tfstate.name
}

output "container_name" {
  value = azurerm_storage_container.tfstate.name
}