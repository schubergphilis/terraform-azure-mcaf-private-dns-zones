resource "azurerm_resource_group" "this" {
  count = var.query_zones ? 0 : 1
  name     = var.resource_group_name
  location = var.location
  tags = merge(
    var.tags,
    tomap({
      "Resource Type" = "Resource Group"
    })
  )
}

resource "azurerm_private_dns_zone" "this" {
  for_each            = var.query_zones ? {} : local.private_dns_zones
  name                = each.key
  resource_group_name = azurerm_resource_group.this[0].name
  tags = merge(
    var.tags,
    tomap({
      "Resource_Type" = "Private DNS Zone"
    })
  )
}

data "azurerm_private_dns_zone" "this" {
  for_each            = var.query_zones ? local.private_dns_zones : {}
  name                = each.key
  resource_group_name = var.resource_group_name
}