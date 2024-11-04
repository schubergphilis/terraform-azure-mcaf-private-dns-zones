output "private_dns_zones" {
  description = "object with all created Private DNS Zones"
  value       = azurerm_private_dns_zone.this
}