provider "google" {
  credentials = file(var.credentialsfile)
  project     = var.project
  region      = var.defaultregion
  zone        = var.defaultzone
}

resource "google_compute_instance" "startup" {
  name         = "gcpinst"
  machine_type = "n1-standard-1"
  zone         = var.defaultzone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<!doctype html><html><body><h1>Hello from Shartul on Google Cloud!</h1></body></html>' | sudo tee /var/www/html/index.html"

  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }  

  tags = ["http-server"]
}

