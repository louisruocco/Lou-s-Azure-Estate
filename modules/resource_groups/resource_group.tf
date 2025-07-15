resource "azurerm_resource_group" "lou-rg" {
  name     = var.rg_name
  location = var.location
}