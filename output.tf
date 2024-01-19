output "Ec2_Public_ip" {
  description = "Ec2 Public ip"
  value       = module.ec2_instance.public_ip
}