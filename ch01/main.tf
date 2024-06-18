
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.56.0"
    }
  }

  required_version = ">= 1.7.0"
}

provider "google" {
  project = var.project_name
  region  = var.default_region
  zone    = var.default_zone
}

resource "google_project_service" "compute" {
  project = var.project_name
  service = "compute.googleapis.com"

  disable_on_destroy = false
}





