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