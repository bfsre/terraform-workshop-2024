variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "region" {
  type        = string
  description = "Region of the subnet"
  default = "us-central1"
}

variable "instance_name" {
  type        = string
  description = "Name of the instance"
}

variable "network_name" {
  type        = string
  description = "Name of the network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "machine_type" {
  type        = string
  description = "Machine Type of GCE"
  default = "e2-micro"
}

variable "gce_image" {
  type        = string
  description = "image of GCE boot disk"
  default = "debian-cloud/debian-11"
}

variable "instance_tag" {
  type = string
  description = "instance-tag"
  default = "gce"
}
