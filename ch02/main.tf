# Create VPC Network for building VM
resource "google_compute_network" "workshop_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

# Create subnet
resource "google_compute_subnetwork" "workshop_subnetwork" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.workshop_network.id
}

resource "google_compute_firewall" "workshop_ssh_rule" {
  name    = "workshop-ssh"
  network = google_compute_network.workshop_network.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags   = [var.instance_tag]
  source_ranges = ["0.0.0.0/0"]
}

# Create a VM in a custom VPC network and subnet
resource "google_compute_instance" "workshop_custom_vm" {
  name         = "my-vm-instance"
  tags         = [var.instance_tag]
  zone         = "us-central1-c"
  machine_type = var.machine_type #e2-small
  network_interface {
    network    = google_compute_network.workshop_network.id
    subnetwork = google_compute_subnetwork.workshop_subnetwork.id
    access_config {}
  }
  boot_disk {
    initialize_params {
      image = var.gce_image  #"debian-cloud/debian-10"
    }
  }
}

