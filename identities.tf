resource "azurerm_user_assigned_identity" "dict-mi" {
  resource_group_name = azurerm_resource_group.dict-rg.name
  location            = azurerm_resource_group.dict-rg.location

  name = "mi-dict"
}

resource "azurerm_user_assigned_identity" "nonna-mi" {
  resource_group_name = azurerm_resource_group.nonna-rg.name
  location            = azurerm_resource_group.nonna-rg.location

  name = "mi-nonna"
}