# IP
output "public_ip" {
  value = module.vm.public_ip_address
}

output "private_ip" {
  value = module.vm.private_ip_address
}

# Network
output "network_interface_id" {
  value = module.network.nic_id
}

# Environment
output "vm_name" {
  value = module.vm.name
}

output "environment" {
  value = var.environment
}

output "project_name" {
  value = var.project_name
}
