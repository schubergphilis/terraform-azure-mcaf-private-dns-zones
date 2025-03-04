output "private_dns_zones" {
  description = "object with all created Private DNS Zones"
  value       = var.query_zones ? data.azurerm_private_dns_zone.this : azurerm_private_dns_zone.this
}

output "resource_group_id" {
  description = "ID of the Resource Group created by the module"
  value       = azurerm_resource_group.this.id
}