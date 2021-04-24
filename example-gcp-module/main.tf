provider "google" {
  credentials = file(var.credentialsfile)
  project     = var.project
  region      = var.defaultregion
  zone        = var.defaultzone
}

module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "1.3.0"
  project_id                         = var.project
  region                             = var.defaultregion
  router                             = module.cloud-router.router.name
  name                               = "my-cloud-nat"
}

module "cloud-router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "0.2.0"
  name    = "example-router"
  project = var.project
  region  = var.defaultregion
  network = "default"
}