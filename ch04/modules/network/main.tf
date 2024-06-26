# Create VPC Network for building VM
resource "google_compute_network" "workshop_network" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

# Create subnet
resource "google_compute_subnetwork" "workshop_subnetwork" {
  name          = var.subnet_name
  project       = var.project_id
  ip_cidr_range = var.subnet_ip_cidr_range
  region        = var.region
  network       = google_compute_network.workshop_network.id
}

resource "google_compute_firewall" "workshop_ssh_rule" {
  name    = var.firewall_rule_name
  project = var.project_id
  network = google_compute_network.workshop_network.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags   = [var.instance_tag]
  source_ranges = ["0.0.0.0/0"]
}
