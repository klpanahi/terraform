output "ec2_connection_string" {
  value = "ssh -i ${var.ec2_ssh_key_name}.pem ubuntu@${module.admin_node.public_ip}"
}