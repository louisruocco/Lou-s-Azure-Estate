#Virtual Networks 
resource "azurerm_virtual_network" "dev-vnet" {
  name                = "vnet-dev-env"
  resource_group_name = azurerm_resource_group.dev-rg.name
  location            = "UK South"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network" "sql-vnet" {
  name                = "vnet-sql"
  resource_group_name = azurerm_resource_group.sql-rg.name
  location            = "UK South"
  address_space       = ["10.1.0.0/16"]
}

#Subnets
resource "azurerm_subnet" "dev-subnet-1" {
  name                 = "subnet-dev-1"
  resource_group_name  = azurerm_resource_group.dev-rg.name
  virtual_network_name = azurerm_virtual_network.dev-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "sql-subnet-1" {
  name                 = "subnet-sql-1"
  resource_group_name  = azurerm_resource_group.sql-rg.name
  virtual_network_name = azurerm_virtual_network.sql-vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}

# Public IP Addresses
resource "azurerm_public_ip" "vmdev1-pip" {
  name                = "pip-vmdev1"
  location            = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "vmsql1-pip" {
  name                = "pip-vmsql1"
  location            = azurerm_resource_group.sql-rg.location
  resource_group_name = azurerm_resource_group.sql-rg.name
  allocation_method   = "Static"
}