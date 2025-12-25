resource "azurerm_virtual_network" "network" {
  name                = "${var.project_name}-${var.environment}-vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.project_name}-${var.environment}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_public_ip" "envoy_pip" {
  name                = "${var.project_name}-${var.environment}-envoy-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "monitor_pip" {
  name                = "${var.project_name}-${var.environment}-monitor-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}
