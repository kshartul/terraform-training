provider "google" {
  credentials = file(var.credentialsfile)
  project     = var.project
  region      = var.defaultregion
  zone        = var.defaultzone
}

resource "google_storage_bucket" "backend-bucket" {
  name          = "sh01-terraform-backend"
  location      = var.defaultregion
  force_destroy = true
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

output "bucket-url" {
  value = google_storage_bucket.backend-bucket.url
} 