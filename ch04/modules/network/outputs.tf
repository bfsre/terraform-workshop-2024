output "network_name" {
  value = google_compute_network.workshop_network.id
}

output "subnet_name" {
  value = google_compute_subnetwork.workshop_subnetwork.id
}