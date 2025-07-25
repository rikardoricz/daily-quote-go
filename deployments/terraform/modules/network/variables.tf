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

# variable "address_space" {
#   type        = list(string)
#   description = "The address space used by the virtual network"
#   default     = ["10.8.0.0/16"]
# }

# variable "dns_servers" {
#   type        = list(string)
#   description = "List of IP addresses of DNS servers"
#   default     = ["10.0.0.4", "10.0.0.5"]
# }
