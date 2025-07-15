resource "azurerm_kubernetes_cluster" "example" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  node_resource_group = var.aks_nrg_name

  default_node_pool {
    name                        = var.default_node_pool_name
    node_count                  = var.node_count
    vm_size                     = var.vm_size
    os_disk_size_gb             = var.os_disk_size_gb
    node_public_ip_enabled      = true
    temporary_name_for_rotation = "tempdefault"
    auto_scaling_enabled        = true
    min_count                   = 1
    max_count                   = 3

    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = "azure"
    load_balancer_sku   = "standard"
    pod_cidr            = var.network_pod_cidr
    service_cidr        = var.network_service_cidr
    dns_service_ip      = var.network_dns_ip
  }

  tags = var.tags
}
