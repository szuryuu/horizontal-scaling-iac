# Azure
variable "resource_group_name" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "key_vault_name" {
  type = string
}

# Environment
variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "size" {
  type = string
}

# Network
variable "address_space" {
  type = list(string)
}

variable "address_prefixes" {
  type = list(string)
}
