output "instance_id" {
  value = google_compute_instance.workshop_custom_vm.id
}

output "instance_metadata_fingerprint" {
  value = google_compute_instance.workshop_custom_vm.metadata_fingerprint
}

output "instance_current_status" {
  value = google_compute_instance.workshop_custom_vm.current_status
}