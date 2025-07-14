provider "azurerm" {
  features {}
}

data "azurerm_kubernetes_cluster" "credentials" {
  name                = module.aks.aks_cluster_name
  resource_group_name = module.resource_group.name
}

provider "helm" {
  kubernetes = {
    host                   = data.azurerm_kubernetes_cluster.credentials.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.cluster_ca_certificate)

  }
}
