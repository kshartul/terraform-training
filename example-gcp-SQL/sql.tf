provider "google" {
  credentials = file(var.credentialsfile)
  project     = var.project
  region      = var.defaultregion
  zone        = var.defaultzone
}

resource "google_sql_database_instance" "db_inst" {
  name             = "masterinstance"
  region           = var.defaultregion
  database_version = "POSTGRES_11"
  depends_on = [google_service_networking_connection.private_vpc_connection]
  
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.private_network.id
    }
  }
  deletion_protection = false
}

