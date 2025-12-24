# Azure
resource_group_name = "devops-intern-sandbox-rg-sandbox-sea"
subscription_id     = "ff2d14b3-1df7-4fb7-9440-963a479f8079"
key_vault_name      = "rg-intern-devops"

# Environment
environment  = "dev"
project_name = "horizontal-scale-envoyproxy"
size         = "Standard_B1s"

# Network
address_space    = ["10.1.0.0/16"]
address_prefixes = ["10.1.1.0/24", "10.1.2.0/24"]
