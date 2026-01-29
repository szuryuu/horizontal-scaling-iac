terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_key_vault" "main" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.main.name
}

data "azurerm_key_vault_secret" "ssh" {
  name         = "ssh-public-keys"
  key_vault_id = data.azurerm_key_vault.main.id
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  # Configuration
  project_name     = var.project_name
  environment      = var.environment
  address_space    = var.address_space
  address_prefixes = var.address_prefixes
  # dns_record       = module.backend-vmss.dns_record
}

module "control-plane" {
  source              = "../../modules/control-plane"
  resource_group_name = data.azurerm_resource_group.main.name
  resource_group_id   = data.azurerm_resource_group.main.id
  location            = data.azurerm_resource_group.main.location
  # size                = var.size
  size = "Standard_B2s"

  # Configuration
  project_name          = var.project_name
  environment           = var.environment
  network_interface_ids = [module.network.control_plane_nic_id]
  ssh_public_key        = data.azurerm_key_vault_secret.ssh.value
  subscription_id       = var.subscription_id

  depends_on = [module.network]
}

module "backend-vmss" {
  source              = "../../modules/backend-vmss"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  # Configuration
  project_name       = var.project_name
  environment        = var.environment
  ssh_public_key     = data.azurerm_key_vault_secret.ssh.value
  subnet_id          = module.network.subnet_id
  lb_backend_pool_id = module.network.backend_pool_id
  consul_server_ip   = module.network.control_plane_private_ip

  depends_on = [module.network, module.control-plane]
}

module "envoy-lb" {
  source              = "../../modules/envoy-lb"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  size                = var.size

  # Configuration
  project_name          = var.project_name
  environment           = var.environment
  network_interface_ids = [module.network.envoy_nic_id]
  ssh_public_key        = data.azurerm_key_vault_secret.ssh.value
  control_plane_ip      = module.network.control_plane_private_ip

  depends_on = [module.network, module.control-plane]
}

# module "monitoring" {
#   source              = "../../modules/monitoring"
#   resource_group_name = data.azurerm_resource_group.main.name
#   location            = data.azurerm_resource_group.main.location
#   size                = var.size

#   # Configuration
#   project_name          = var.project_name
#   environment           = var.environment
#   network_interface_ids = [module.network.monitor_nic_id]
#   ssh_public_key        = data.azurerm_key_vault_secret.main.value

#   depends_on = [module.network]
# }
