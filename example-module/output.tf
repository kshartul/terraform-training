
### Output ###
output "instance_public_ip" {
  value = module.ec2-instance.public_ip
}

output "instance_state" {
  value = module.ec2-instance.instance_state
  description = "The state of the server instance."
}

output "instance_security_group" {
  value = module.ec2-instance.security_groups
}


