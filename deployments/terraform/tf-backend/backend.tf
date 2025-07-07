provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfstate" {
  location = "polandcentral"
  name     = "tfstate-rg"
}

resource "random_pet" "prefix" {
  length = 1
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "dailyquotetfstate"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
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