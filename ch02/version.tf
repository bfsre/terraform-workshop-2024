terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "you-need-to-change-this-value-or-something-bad-happens"
  region  = "you-need-to-change-this-value-or-something-bad-happens"
  zone    = "you-need-to-change-this-value-or-something-bad-happens"
}