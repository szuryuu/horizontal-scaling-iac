resource "azurerm_linux_virtual_machine" "control_plane" {
  name                = "${var.project_name}-${var.environment}-control-plane"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = "adminuser"

  disable_password_authentication = true
  network_interface_ids           = var.network_interface_ids

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(templatefile("${path.module}/cloud-init.yml", {
    subscription_id     = var.subscription_id
    resource_group_name = var.resource_group_name
    vmss_name           = var.vmss_name
  }))

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.environment
    project     = var.project_name
  }
}

resource "azurerm_role_assignment" "control_plane_reader" {
  scope = var.resource_group_id
  role_definition_name = "Reader"
  principal_id = azurerm_linux_virtual_machine.control_plane.identity[0].principal_id
}
