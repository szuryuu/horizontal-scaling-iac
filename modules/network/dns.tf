resource "azurerm_private_dns_zone" "internal" {
  name                = "api.internal"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_a_record" "backend" {
  name                = "api-backend"
  zone_name           = azurerm_private_dns_zone.internal.name
  resource_group_name = var.resource_group_name
  ttl                 = 10

  records = var.dns_record
}
