resource "azurerm_virtual_network" "dev-vnet" {
  name                = "vnet-dev-env"
  resource_group_name = azurerm_resource_group.dev-rg.name
  location            = "UK South"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "dev-subnet-1" {
  name                 = "subnet-dev-1"
  resource_group_name  = azurerm_resource_group.dev-rg.name
  virtual_network_name = azurerm_virtual_network.dev-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "vmdev1-pip" {
  name                = "pip-vmdev1"
  location            = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "vmdev2-pip" {
  name                = "pip-vmdev2"
  location            = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "dev-subnet-1-nsg" {
  name                = "nsg-dev-subnet-1"
  location            = "UK South"
  resource_group_name = azurerm_resource_group.dev-rg.name
}

resource "azurerm_network_security_rule" "example" {
  name                        = "AllowRDPBetweenVM1andVM2"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "3389"
  resource_group_name         = azurerm_resource_group.dev-rg.name
  network_security_group_name = azurerm_network_security_group.dev-subnet-1-nsg.name
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.dev-subnet-1.id
  network_security_group_id = azurerm_network_security_group.dev-subnet-1-nsg.id
}