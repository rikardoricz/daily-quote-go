output "vnet_id" {
  description = "The ID of the vnet"
  value       = azurerm_virtual_network.example.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.example.id
}