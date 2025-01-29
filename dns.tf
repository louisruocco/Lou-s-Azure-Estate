resource "azurerm_private_dns_zone" "lou-dns" {
  name                = "lousdnszone.co.uk"
  resource_group_name = azurerm_resource_group.dev-rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dev-dns-net-link" {
  name                  = "dev-dns-vnet-link"
  resource_group_name   = azurerm_resource_group.dev-rg.name
  private_dns_zone_name = azurerm_private_dns_zone.lou-dns.name
  virtual_network_id    = azurerm_virtual_network.dev-vnet.id
  registration_enabled  = "true"
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql-dns-net-link" {
  name                  = "sql-dns-vnet-link"
  resource_group_name   = azurerm_resource_group.sql-rg.name
  private_dns_zone_name = azurerm_private_dns_zone.lou-dns.name
  virtual_network_id    = azurerm_virtual_network.sql-vnet.id
  registration_enabled  = "false"
}