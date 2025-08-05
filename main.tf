terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-lou"
    storage_account_name = "salou"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "rg-lou" {
  source   = "./modules/resource_groups"
  rg_name  = "rg-lou"
  location = "UK South"
}

module "vnet-lou" {
  source              = "./modules/vnet"
  vnet_name           = "vnet-lou"
  location            = "UK South"
  resource_group_name = module.rg-lou.resource_group_name
  address_space       = "10.0.0.0/16"
}

module "subnet-lou" {
  source              = "./modules/subnet"
  subnet_name         = "subnet-lou"
  vnet_name           = module.vnet-lou.vnet_name
  resource_group_name = module.rg-lou.resource_group_name
  location            = "UK South"
  address_prefix      = "10.0.1.0/24"
}

module "nic-vm-lou" {
  source              = "./modules/nic"
  nic_name            = "nic-vm-lou"
  location            = "UK South"
  resource_group_name = module.rg-lou.resource_group_name
  subnet_id           = module.subnet-lou.subnet_id
}

module "vm-lou" {
  source               = "./modules/vm"
  vm_name              = "vm-lou"
  resource_group_name  = module.rg-lou.resource_group_name
  admin_username       = "Louis"
  admin_password       = "Hashirama@985"
  nic_name             = module.nic-vm-lou.network_interface_name
  network_interface_id = module.nic-vm-lou.network_interface_id
  sku_size             = "Standard_B1ms"
  location             = "UK South"
}