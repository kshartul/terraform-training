
data "google_compute_network" "my-network" {

  name = var.vpc_network_name

}

output "subnets" {
    value = data.google_compute_network.my-network.subnetworks_self_links
}