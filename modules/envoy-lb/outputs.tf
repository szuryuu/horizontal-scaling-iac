output "vm_name" {
  value = azurerm_linux_virtual_machine.envoy-lb.name
}

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.envoy-lb.public_ip_address
}

output "vm_private_ip" {
  value = azurerm_linux_virtual_machine.envoy-lb.private_ip_address
}
