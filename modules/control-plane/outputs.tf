output "name" {
  value = azurerm_linux_virtual_machine.control_plane.name
}

output "public_ip" {
  value = azurerm_linux_virtual_machine.control_plane.public_ip_address
}

output "private_ip" {
  value = azurerm_linux_virtual_machine.control_plane.private_ip_address
}
