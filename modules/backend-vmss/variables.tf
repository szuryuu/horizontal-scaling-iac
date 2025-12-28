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

variable "ssh_public_key" {
  type    = string
  default = ""
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "lb_backend_pool_id" {
  type = string
}
