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

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "address_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "dns_record" {
  type = list(string)
}
