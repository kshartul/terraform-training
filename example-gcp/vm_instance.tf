provider "google" {
  credentials = file(var.credentialsfile)
  project     = var.project
  region      = var.defaultregion
  zone        = var.defaultzone
}

resource "google_compute_network" "gcp_vpc" {
  name = var.vpc_network_name
}

resource "google_compute_subnetwork" "gcp_subnet" {
  name          = var.subnet_name
  ip_cidr_range = "192.168.1.0/24"
  region        = var.defaultregion
  network       = google_compute_network.gcp_vpc.id
}

resource "google_compute_instance" "gcp_vm" {
  name         = var.instance_name
  machine_type = "n1-standard-1"
  zone         = var.defaultzone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.gcp_subnet.id
  }
}