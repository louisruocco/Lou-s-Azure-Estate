output "network_interface_id" {
  value = azurerm_network_interface.*.id
}

output "network_interface_name" {
  value = azurerm_network_interface.*.name
}