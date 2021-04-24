resource "google_compute_instance" "instance1" {
  name         = "vminstance1"
  machine_type = "n1-standard-1"
  zone         = var.defaultzone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      size = 10
    }
  } 
  network_interface {
    network = "default"
  }  
}

resource "google_compute_disk" "disk1" {
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  size  =  15
  image = "debian-9"
  physical_block_size_bytes = 4096
  }

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.disk1.id
  instance = google_compute_instance.instance1.id
}
