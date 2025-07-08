resource "azurerm_resource_group" "dailyquote" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = var.environment
  }
}

resource "azurerm_container_registry" "dailyquote" {
  name                = var.acr_name
  location            = azurerm_resource_group.dailyquote.location
  resource_group_name = azurerm_resource_group.dailyquote.name
  sku                 = var.acr_sku
  admin_enabled       = false
}

resource "azurerm_kubernetes_cluster" "dailyquote" {
  name                = var.aks_name
  location            = azurerm_resource_group.dailyquote.location
  resource_group_name = azurerm_resource_group.dailyquote.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2ls_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.environment
  }
}

# role assignment for aks acr pull
resource "azurerm_role_assignment" "dailyqoute" {
  principal_id                     = azurerm_kubernetes_cluster.dailyquote.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.dailyquote.id
  skip_service_principal_aad_check = true
}