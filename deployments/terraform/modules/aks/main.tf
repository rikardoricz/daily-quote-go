resource "azurerm_kubernetes_cluster" "example" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  node_resource_group = var.aks_nrg_name

  default_node_pool {
    name           = var.default_node_pool_name
    node_count     = var.node_count
    vm_size        = var.vm_size
    # vnet_subnet_id = var.subnet_id
    os_disk_size_gb = var.os_disk_size_gb
    node_public_ip_enabled = true
    temporary_name_for_rotation = "tempdefault" 
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  tags = var.tags
}

# role assignment for aks acr pull
# resource "azurerm_role_assignment" "example" {
#   principal_id                     = azurerm_kubernetes_cluster.example.kubelet_identity[0].object_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.example.id
#   skip_service_principal_aad_check = true
# }