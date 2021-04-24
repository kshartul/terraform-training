output "ExternalIPAddress" {
  description = "The ephemeral IP address attached to the VM instance"
  value       = google_compute_instance.startup.network_interface.0.access_config.0.nat_ip 
}