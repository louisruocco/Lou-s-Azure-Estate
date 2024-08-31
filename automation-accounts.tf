resource "azurerm_automation_account" "nonna-autoacc" {
  name                = "autoacc-nonna"
  location            = azurerm_resource_group.nonna-rg.location
  resource_group_name = azurerm_resource_group.nonna-rg.name

  sku_name = "Basic"
}

resource "azurerm_automation_account" "dict-autoacc" {
  name                = "autoacc-dict"
  location            = azurerm_resource_group.dict-rg.location
  resource_group_name = azurerm_resource_group.dict-rg.name

  sku_name = "Basic"
}

