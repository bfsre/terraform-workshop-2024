variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "region" {
  type        = string
  description = "Region of the subnet"
  default = "us-central1"
}

variable "network_name" {
  type        = string
  description = "Name of the network"
  default = "vpc-network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default = "subnet"
}

variable "firewall_rule_name" {
  type        = string
  description = "Name of the firewall rule"
  default = "allow-ssh"
}

variable "subnet_ip_cidr_range" {
  type        = string
  description = "IP CIDR range of the subnet"
}

variable "instance_tag" {
  type = string
  description = "instance-tag"
  default = "gce"
}