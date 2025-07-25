provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfstate" {
  location = "polandcentral"
  name     = "rg-tfstate"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "stdailyquotetfstate"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}
