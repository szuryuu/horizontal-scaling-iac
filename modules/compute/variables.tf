variable "project_name" {
  type    = string
  default = "horizontal-scale-envoyproxy"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "resource_group_name" {
  type    = string
  default = "devops-intern-sandbox-rg-sandbox-sea"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "network_interface_ids" {
  type    = list(string)
  default = []
}

variable "ssh_public_key" {
  type    = string
  default = ""
}
