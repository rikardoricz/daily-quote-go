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

variable "dns_prefix" {
  description = "Prefix of the DNS"
  type        = string
  default     = "exampleaks1"
}

variable "acr_name" {
  type = string
}
variable "acr_sku" {
  type    = string
  default = "Standard"
}

