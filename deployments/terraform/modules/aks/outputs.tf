output "client_certificate" {
  description = "Public certificate used by clients to authenticate to the Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
  sensitive   = true
}

output "kube_config" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
  value       = azurerm_kubernetes_cluster.example.kube_config_raw
  sensitive   = true
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.example.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.example.name
}

output "aks_cluster_kubernetes_version" {
  value = azurerm_kubernetes_cluster.example.kubernetes_version
}

output "aks_kubelet_identity_object_id" {
  value = azurerm_kubernetes_cluster.example.kubelet_identity[0].object_id
}