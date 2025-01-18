resource "azurerm_network_interface" "dev-vm1-nic" {
  name                = "nic-dev-vm-1"
  location            = "UK South"
  resource_group_name = azurerm_resource_group.dev-rg.name

  ip_configuration {
    name                          = "dev-vm-1-private-ip"
    subnet_id                     = azurerm_subnet.dev-subnet-1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.vmdev1-ip
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
    private_ip_address_allocation = "Static"
    private_ip_address            = var.vmdev2-ip
  }
}

resource "azurerm_network_interface" "sql-vm1-nic" {
  name                = "nic-sql-vm-1"
  location            = "UK South"
  resource_group_name = azurerm_resource_group.sql-rg.name

  ip_configuration {
    name                          = "sql-vm-1-private-ip"
    subnet_id                     = azurerm_subnet.sql-subnet-1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.vmsql1-ip
    public_ip_address_id          = azurerm_public_ip.vmsql1-pip.id
  }
}

resource "azurerm_network_interface" "sql-vm2-nic" {
  name                = "nic-sql-vm-2"
  location            = "UK South"
  resource_group_name = azurerm_resource_group.sql-rg.name

  ip_configuration {
    name                          = "sql-vm-2-private-ip"
    subnet_id                     = azurerm_subnet.sql-subnet-1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.vmsql2-ip
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
    sku       = "2022-Datacenter"
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
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "sql-vm-1" {
  name                  = "vmsql1"
  resource_group_name   = azurerm_resource_group.sql-rg.name
  location              = "UK South"
  size                  = "Standard_B2ms"
  admin_username        = "Louis"
  admin_password        = var.sql_vm_1_admin_password
  network_interface_ids = [azurerm_network_interface.sql-vm1-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_managed_disk" "sql-vm-1-managed-disk-1" {
  name                 = "vmsql1-managed-disk"
  location             = azurerm_resource_group.sql-rg.location
  resource_group_name  = azurerm_resource_group.sql-rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "50"
}

resource "azurerm_virtual_machine_data_disk_attachment" "sql-vm-1-managed-disk-1-attachment" {
  managed_disk_id    = azurerm_managed_disk.sql-vm-1-managed-disk-1.id
  virtual_machine_id = azurerm_windows_virtual_machine.sql-vm-1.id
  lun                = 10
  caching            = "ReadWrite"
}


resource "azurerm_windows_virtual_machine" "sql-vm-2" {
  name                  = "vmsql2"
  resource_group_name   = azurerm_resource_group.sql-rg.name
  location              = "UK South"
  size                  = "Standard_B2ms"
  admin_username        = "Louis"
  admin_password        = var.sql_vm_2_admin_password
  network_interface_ids = [azurerm_network_interface.sql-vm2-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}