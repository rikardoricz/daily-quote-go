output "nsg_name" {
  description = "The name of the nsg"
  value       = azurerm_network_security_group.example.name
}

output "vnet_id" {
  description = "The ID of the vnet"
  value       = azurerm_virtual_network.example.id
}

output "vnet_name" {
  description = "The name of the vnet"
  value       = azurerm_virtual_network.example.name
}

output "subnet1_id" {
  description = "The ID of the subnet1"
  value       = azurerm_subnet.subnet1.id
}

output "subnet1_name" {
  description = "The name of the subnet1"
  value       = azurerm_subnet.subnet1.name
}

output "subnet2_id" {
  description = "The ID of the subnet2"
  value       = azurerm_subnet.subnet2.id
}

output "subnet2_name" {
  description = "The name of the subnet2"
  value       = azurerm_subnet.subnet2.name
}