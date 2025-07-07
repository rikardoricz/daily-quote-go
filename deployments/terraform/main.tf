resource "azurerm_resource_group" "checkingtfstate-rg" {
  name     = "checkingtfstate-rg"
  location = "polandcentral"
  tags = {
    environment = "dev"
  }
}