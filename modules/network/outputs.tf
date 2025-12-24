# Subnet
output "subnet_id" {
  value = azurerm_subnet.vm_subnet.id
}

# Public IP
output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

# Virtual Network (VNet)
output "vnet_id" {
  value = azurerm_virtual_network.network.id
}

# Network Interface Card (NIC)
output "nic_id" {
  value = azurerm_network_interface.nic.id
}
