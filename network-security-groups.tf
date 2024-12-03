resource "azurerm_network_security_group" "dev-subnet-1-nsg" {
  name                = "nsg-dev-subnet-1"
  location            = "UK South"
  resource_group_name = azurerm_resource_group.dev-rg.name
}


resource "azurerm_subnet_network_security_group_association" "dev-subnet-1-nsg-association" {
  subnet_id                 = azurerm_subnet.dev-subnet-1.id
  network_security_group_id = azurerm_network_security_group.dev-subnet-1-nsg.id
}

resource "azurerm_network_security_group" "sql-subnet-1-nsg" {
  name                = "nsg-sql-subnet-1"
  location            = "UK South"
  resource_group_name = azurerm_resource_group.sql-rg.name
}

resource "azurerm_subnet_network_security_group_association" "sql-subnet-1-nsg-association" {
  subnet_id                 = azurerm_subnet.sql-subnet-1.id
  network_security_group_id = azurerm_network_security_group.sql-subnet-1-nsg.id
}

resource "azurerm_network_security_rule" "sql-subnet-1-allow-rdp" {
  name                        = "AllowRDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.sql-rg.name
  network_security_group_name = azurerm_network_security_group.sql-subnet-1-nsg.name
}

# dev-subnet-1 NSG Rules
resource "azurerm_network_security_rule" "dev-subnet-1-allow-rdp" {
  name                        = "AllowRDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.dev-rg.name
  network_security_group_name = azurerm_network_security_group.dev-subnet-1-nsg.name
}

resource "azurerm_network_security_rule" "dev-subnet-1-allow-ping" {
  name                        = "AllowPingFromvmdev1"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Icmp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.vmdev1-ip
  destination_address_prefix  = var.vmdev2-ip
  resource_group_name         = azurerm_resource_group.dev-rg.name
  network_security_group_name = azurerm_network_security_group.dev-subnet-1-nsg.name
}