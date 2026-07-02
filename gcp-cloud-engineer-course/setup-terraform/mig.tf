# creacion del template de migracion

resource "google_compute_instance_template" "tpl" {
  name_prefix  = "app-tpl-"
  machine_type = "e2-micro"
  tags         = ["web-server"]
  disk {
    source_image = "debian-cloud/debian-11"
  }
  network_interface {
    subnetwork = google_compute_subnetwork.subnet_us.id
  }
}

# aqui definimos el instance_group
resource "google_compute_region_instance_group_manager" "mig" {
  # nombre de el instance group
  name = "app-mig"
  region = "us-central1"
  #nombre de las maquinas
  base_instance_name = "app"
  version {
    instance_template = google_compute_instance_template.tpl.id
  }
  # cantidad de maquinas a crear
  target_size = 2
}