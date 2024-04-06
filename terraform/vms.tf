resource "azurerm_network_interface" "dev-vm1-nic" {
  name                = "nic-dev-vm-1"
  location            = "UK South"
  resource_group_name = azurerm_resource_group.dev-rg.name

  ip_configuration {
    name                          = "dev-vm-1-private-ip"
    subnet_id                     = azurerm_subnet.dev-subnet-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vmdev1-pip.id
  }
}

resource "azurerm_network_interface" "dev-vm2-nic" {
  name                = "nic-dev-vm-2"
  location            = "UK South"
  resource_group_name = azurerm_resource_group.dev-rg.name

  ip_configuration {
    name                          = "dev-vm-2-private-ip"
    subnet_id                     = azurerm_subnet.dev-subnet-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vmdev2-pip.id
  }
}

resource "azurerm_windows_virtual_machine" "dev-vm-1" {
  name                  = "vmdev1"
  resource_group_name   = azurerm_resource_group.dev-rg.name
  location              = "UK South"
  size                  = "Standard_B2ms"
  admin_username        = "Louis"
  admin_password        = var.dev_vm_1_admin_password
  network_interface_ids = [azurerm_network_interface.dev-vm1-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "dev-vm-2" {
  name                  = "vmdev2"
  resource_group_name   = azurerm_resource_group.dev-rg.name
  location              = "UK South"
  size                  = "Standard_B2ms"
  admin_username        = "Louis"
  admin_password        = var.dev_vm_2_admin_password
  network_interface_ids = [azurerm_network_interface.dev-vm2-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}