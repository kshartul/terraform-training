provider "google" {
  credentials = file(var.credentialsfile)
  project     = var.project
  region      = var.defaultregion
  zone        = var.defaultzone
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
    subnetwork = data.google_compute_network.my-network.subnetworks_self_links[0]
  }
}

output "vm-instance-id" {
    value = google_compute_instance.gcp_vm.instance_id
}