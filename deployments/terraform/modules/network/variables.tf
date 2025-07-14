variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to set on the resource group"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Location (region) of the resource group"
  type        = string
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  type        = list(string)
  description = "The address space used by the virtual network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}
variable "subnet_address_prefixes" {
  type        = list(string)
  description = "The address prefixes for the subnet"
  default     = ["10.0.1.0/24"]
}
