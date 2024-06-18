resource "google_compute_network" "workshop" {
  name = var.vpc_name

  depends_on = [ google_project_service.compute ]
}
