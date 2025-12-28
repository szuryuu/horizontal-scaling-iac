resource "azurerm_network_interface" "envoy_nic" {
  name                = "${var.project_name}-${var.environment}-envoy-nic"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.envoy_pip.id
  }
}

resource "azurerm_network_interface" "monitor_nic" {
  name                = "${var.project_name}-${var.environment}-monitor-nic"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.monitor_pip.id
  }
}

resource "azurerm_network_interface" "control_plane_nic" {
  name                = "${var.project_name}-${var.environment}-control-plane-nic"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.control_plane_pip.id
  }
}
