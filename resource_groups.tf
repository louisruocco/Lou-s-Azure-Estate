resource "azurerm_resource_group" "dev-rg" {
  name     = "rg-lou-dev-env"
  location = "UK South"
}

resource "azurerm_resource_group" "nonna-rg" {
  name     = "rg-lou-nonna"
  location = "UK South"
}

resource "azurerm_resource_group" "sql-ag-rg" {
  name     = "rg-lou-sql"
  location = "UK South"
}

resource "azurerm_resource_group" "dict-rg" {
  name     = "rg-lou-dict"
  location = "UK South"
}