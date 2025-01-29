resource "azurerm_key_vault" "kv-nonna" {
  name                = "nonna-kv"
  location            = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
}