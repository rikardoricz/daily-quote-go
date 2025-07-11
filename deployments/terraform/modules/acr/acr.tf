resource "azurerm_container_registry" "example" {
  name                = var.acr_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.acr_sku
  admin_enabled       = true

  public_network_access_enabled = true
}