resource "google_compute_address" "ip-address" {
  name         = "my-address"
  address_type = "EXTERNAL"
  region       = var.defaultregion
}

resource "google_compute_router" "gcp_router" {
  name    = "my-router"
  region  = var.defaultregion
  network = google_compute_network.gcp_vpc.id
}

resource "google_compute_router_nat" "nat" {
  name                   = "my-router-nat"
  router                 = google_compute_router.gcp_router.name
  region                 = var.defaultregion
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = google_compute_address.ip-address.*.self_link
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.gcp_subnet_one.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
