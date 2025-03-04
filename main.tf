resource "azurerm_resource_group" "this" {
  count    = var.query_zones ? 0 : 1
  name     = var.resource_group_name
  location = var.location
  tags = merge(
    var.tags,
    tomap({
      "Resource Type" = "Resource Group"
    })
  )
}

data "azurerm_private_dns_zone" "this" {
  for_each            = var.query_zones ? local.private_dns_zones : {}
  name                = each.key
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone" "this" {
  for_each            = var.query_zones ? {} : local.private_dns_zones
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