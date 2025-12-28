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

output "vm_control_plane_public_ip" {
  value = module.control-plane.public_ip
}

output "vm_control_plane_private_ip" {
  value = module.control-plane.private_ip
}

# Network
output "envoy_nic_id" {
  value = module.network.envoy_nic_id
}

# output "monitor_nic_id" {
#   value = module.network.monitor_nic_id
# }

# Environment
output "vm_name" {
  value = module.backend-vmss.vm_name
}

output "environment" {
  value = var.environment
}

output "project_name" {
  value = var.project_name
}
