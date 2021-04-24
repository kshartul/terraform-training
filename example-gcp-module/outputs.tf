
output "router" {
  description = "The created router"
  value       = module.cloud-router.router
}

output "cloud-nat" {
  description = "The name of the created Cloud NAT instance"
  value       = module.cloud-nat.name
}