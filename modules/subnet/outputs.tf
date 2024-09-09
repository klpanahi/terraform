output "subnet" {
  description = "All attrbutes for the subnet created by the module"
  value       = aws_subnet.subnet
}

output "subnet_id" {
  description = "The ID of the Subnet being created"
  value       = aws_subnet.subnet.id
}

output "subnet_cidr" {
  description = "The CIDR Block of the Subnet"
  value       = aws_subnet.subnet.cidr_block
}