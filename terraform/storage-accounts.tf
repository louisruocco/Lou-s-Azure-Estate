resource "azurerm_storage_account" "nonnastoracc" {
  name                     = "nonnastoracc"
  resource_group_name      = azurerm_resource_group.nonna-rg.name
  location                 = azurerm_resource_group.nonna-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

