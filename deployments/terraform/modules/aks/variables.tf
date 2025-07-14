variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location (Region)"
  type        = string
}

variable "tags" {
  description = "Tags to set on the resource group"
  type        = map(string)
  default     = {}
}

variable "aks_name" {
  description = "Name of the AKS"
  type        = string
}

variable "aks_nrg_name" {
  description = "Name of the AKS node resource group"
  type        = string
}

variable "default_node_pool_name" {
  description = "Name of default pool node of AKS"
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "Number of nodes in AKS"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the vm in AKS"
  type        = string
  default     = "Standard_B2ls_v2"
}

variable "os_disk_size_gb" {
  description = "The size of the vm disk size"
  type        = number
}

variable "subnet_id" {
  description = "The ID of the subnet where the Kubernetes node pool should exist"
  type        = string
}

variable "dns_prefix" {
  description = "Prefix of the DNS"
  type        = string
  default     = "exampleaks1"
}

variable "network_dns_ip" {
  description = "AKS network profile DNS service IP"
  type        = string
  default     = "10.0.0.10"
}

variable "network_cidr" {
  description = "AKS network profile CIDR"
  type        = string
  default     = "10.0.0.0/16"
}
