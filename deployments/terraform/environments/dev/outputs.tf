output "resource_group_name" {
  value = module.resource_group.name
}

output "kubernetes_cluster_name" {
  value = module.aks.aks_cluster_name
}

output "client_certificate" {
  value = module.aks.client_certificate
  sensitive = true
}

output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}