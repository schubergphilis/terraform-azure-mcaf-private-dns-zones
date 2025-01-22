resource "azurerm_resource_group" "this" {
  name     = var.resource_group.name
  location = var.location
  tags = merge(
    var.tags,
    tomap({
      "Resource Type" = "Resource Group"
    })
  )
}

resource "azurerm_private_dns_zone" "this" {
  for_each            = local.private_dns_zones
  name                = each.key
  resource_group_name = azurerm_resource_group.this.name

  tags = merge(
    var.tags,
    tomap({
      "Resource_Type" = "Private DNS Zone"
    })
  )
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each              = var.virtual_network_id != null ? local.private_dns_zones : {}
  name                  = "${each.key}-vnet-link"
  resource_group_name   = azurerm_resource_group.this.name
  private_dns_zone_name = azurerm_private_dns_zone.this[each.key].name
  virtual_network_id    = var.virtual_network_id

  depends_on = [azurerm_private_dns_zone.this]

  tags = merge(
    var.tags,
    tomap({
      "Resource_Type" = "Private DNS Zone Virtual Network Link"
    })
  )
}