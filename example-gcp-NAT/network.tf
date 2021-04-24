provider "google" {
  credentials = file(var.credentialsfile)
  project     = var.project
  region      = var.defaultregion
  zone        = var.defaultzone
}

resource "google_compute_network" "gcp_vpc" {
  name                    = "vpcnetwork"    
  auto_create_subnetworks = "false" 
   }                                # network is created in custom subnet mode,
                                    # user can explicitly connect to subnet resources
                                    # if true subnet will automatically created under each region by default


resource "google_compute_route" "route-ilb" {
  name             = "route-ilb"
  dest_range       = "0.0.0.0/0"      
  network          = google_compute_network.gcp_vpc.name
  next_hop_gateway = "default-internet-gateway"
}

resource "google_compute_subnetwork" "gcp_subnet_one" {
  name          = "first-subnetwork"
  ip_cidr_range = "192.168.1.0/24"
  region        = var.defaultregion
  network       = google_compute_network.gcp_vpc.id
}

resource "google_compute_subnetwork" "gcp_subnet_two" {
  name          = "second-subnetwork"
  ip_cidr_range = "192.168.2.0/24"
  region        = var.defaultregion
  network       = google_compute_network.gcp_vpc.id
}
