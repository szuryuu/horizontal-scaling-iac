resource "azurerm_linux_virtual_machine_scale_set" "backend" {
  name                = "${var.project_name}-backend-${var.environment}-vmss"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard_B1ms"
  instances           = 2
  admin_username      = "adminuser"

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

  custom_data = base64encode(file("${path.module}/cloud-init.yml"))

  network_interface {
    name    = "backend-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id

      public_ip_address {
        name = "public-ip"
      }

      load_balancer_backend_address_pool_ids = [var.lb_backend_pool_id]
    }
  }

  tags = {
    environment = var.environment
    project     = var.project_name
  }
}
