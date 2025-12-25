# VM
output "vm_envoy_lb_public_ip" {
  value = module.envoy-lb.public_ip
}

output "vm_envoy_lb_private_ip" {
  value = module.envoy-lb.private_ip
}

# output "vm_monitoring_public_ip" {
#   value = module.monitoring.public_ip
# }

# output "vm_monitoring_private_ip" {
#   value = module.monitoring.private_ip
# }

# Network
output "network_interface_id" {
  value = module.network.nic_id
}

# Environment
output "vm_name" {
  value = module.backend_vmss.vm_name
}

output "environment" {
  value = var.environment
}

output "project_name" {
  value = var.project_name
}
