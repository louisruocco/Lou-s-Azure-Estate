resource "azurerm_key_vault" "dict-kv" {
  name                        = "kv-dict"
  location                    = azurerm_resource_group.dict-rg.location
  resource_group_name         = azurerm_resource_group.dict-rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
}