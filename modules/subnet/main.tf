## Create The Subnet
resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  tags = merge({
    Name = "${var.subnet_name}_${var.subnet_iterator}"
  }, var.tags)
}

## Associate the Subnet with the Route Table
resource "aws_route_table_association" "route_table_association" {
  count          = length(var.route_table_ids)
  subnet_id      = aws_subnet.subnet.id
  route_table_id = var.route_table_ids[count.index]
}