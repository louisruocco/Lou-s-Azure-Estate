# resource "azurerm_key_vault" "kv-dict" {
#   name                = "dict-kv"
#   location            = azurerm_resource_group.dict-rg.location
#   resource_group_name = azurerm_resource_group.dict-rg.name
#   tenant_id           = var.tenant_id
#   sku_name            = "standard"
# }