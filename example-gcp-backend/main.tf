provider "google" {
  credentials = file(var.credentialsfile)
  project     = var.project
  region      = var.defaultregion
  zone        = var.defaultzone
}

terraform {
    backend "gcs"{
        bucket      = "sh01-terraform-backend"
        prefix      = "instance_disk/tfstate"
        credentials = "./learning-gcp.json"  #varible not accepted so directly given credentials
    }
}