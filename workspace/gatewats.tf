## Create the EIP for the single NAT Gateway
resource "aws_eip" "nat_gateway" {
  domain = "vpc"
}

# ## This will always be a single NAT Gateway in the first public region
# ## We will likely need to rework this code so we can do a multi-AZ Nat
# resource "aws_nat_gateway" "nat_gateway" {
#   allocation_id = aws_eip.nat_gateway.id
#   subnet_id     = module.compute_subnet[0].subnet_id
# }

## Internet Gateway setup for the public subnet
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id
}