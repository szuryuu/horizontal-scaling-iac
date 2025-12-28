variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_id" {
  type = string
}

variable "location" {
  type = string
}

variable "size" {
  type = string
}

variable "network_interface_ids" {
  type    = list(string)
  default = []
}

variable "ssh_public_key" {
  type    = string
  default = ""
}

variable "subscription_id" {
  type = string
}

variable "vmss_name" {
  type = string
}
