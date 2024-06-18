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

