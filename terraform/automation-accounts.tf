resource "azurerm_automation_account" "nonna-autoacc" {
  name                = "autoacc-nonna"
  location            = azurerm_resource_group.nonna-rg.location
  resource_group_name = azurerm_resource_group.nonna-rg.name

  sku_name = "Basic"
}

resource "azurerm_automation_account" "fitness-autoacc" {
  name                = "autoacc-fitness"
  location            = azurerm_resource_group.fitness-rg.location
  resource_group_name = azurerm_resource_group.fitness-rg.name

  sku_name = "Basic"
}