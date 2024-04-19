resource "azurerm_resource_group" "dev-rg" {
  name     = "rg-lou-dev-env"
  location = "UK South"
}

resource "azurerm_resource_group" "nonna-rg" {
  name = "rg-lou-nonna"
  location = "UK South"
}