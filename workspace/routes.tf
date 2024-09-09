# ## Route Internet traffic from the Compute Subnet to the NAT Gateway
# resource "aws_route" "compute_internet_to_nat_gateway" {
#   route_table_id         = aws_route_table.compute_subnet_route_table.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat_gateway.id
#   depends_on             = [aws_route_table.compute_subnet_route_table]
# }

## Route Internet traffic from the Public Subnet to the Internet Gateway
resource "aws_route" "internet_gateway_to_internet" {
  route_table_id         = aws_route_table.compute_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
  depends_on             = [aws_route_table.compute_subnet_route_table]
}