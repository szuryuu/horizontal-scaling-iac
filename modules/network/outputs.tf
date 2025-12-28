# Subnet
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

# IP
output "envoy_public_ip" {
  value = azurerm_public_ip.envoy_pip.ip_address
}

output "monitor_public_ip" {
  value = azurerm_public_ip.monitor_pip.ip_address
}

output "control_plane_private_ip" {
  value = azurerm_network_interface.control_plane_nic.private_ip_address
}

# Virtual Network (VNet)
output "vnet_id" {
  value = azurerm_virtual_network.network.id
}

# Network Interface Card (NIC)
output "envoy_nic_id" {
  value = azurerm_network_interface.envoy_nic.id
}

output "monitor_nic_id" {
  value = azurerm_network_interface.monitor_nic.id
}

output "control_plane_nic_id" {
  value = azurerm_network_interface.control_plane_nic.id
}

# Load Balancer
# output "load_balancer_id" {
#   value = azurerm_lb.load_balancer.id
# }

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}
