# Create a VM in a custom VPC network and subnet
resource "google_compute_instance" "workshop_custom_vm" {
  name         = var.instance_name
  project      = var.project_id
  tags         = [var.instance_tag]
  zone         = "${var.region}-c"
  machine_type = var.machine_type #e2-small
  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name
    access_config {}
  }
  boot_disk {
    initialize_params {
      image = var.gce_image  #"debian-cloud/debian-10"
    }
  }
}