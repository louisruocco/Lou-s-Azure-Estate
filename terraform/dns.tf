resource "azurerm_private_dns_zone" "lou-dev-dns" {
  name                = "loudev.co.uk"
  resource_group_name = azurerm_resource_group.dev-rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "loudev-dns-vnet-link"
  resource_group_name   = azurerm_resource_group.dev-rg.name
  private_dns_zone_name = azurerm_private_dns_zone.lou-dev-dns.name
  virtual_network_id    = azurerm_virtual_network.dev-vnet.id
  registration_enabled = "true"
}