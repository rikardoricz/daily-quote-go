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

variable "acr_name" {
  description = "The name of the ACR"
  type = string
}

variable "acr_sku" {
  description = "SKU of the ACR"
  type    = string
  default = "Standard"
}

