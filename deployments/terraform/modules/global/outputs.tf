output "name" {
  description = "Name of resource group"
  value       = azurerm_resource_group.example.name
}

output "location" {
  description = "Location (region) of resource group"
  value       = azurerm_resource_group.example.location
}
