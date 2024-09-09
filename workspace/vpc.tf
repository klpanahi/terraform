resource "aws_vpc" "main" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

## Here we are creating a Route Table and associating that route table with each subnet
resource "aws_route_table" "compute_subnet_route_table" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "compute-subnet-rt-${var.vpc_name}-${data.aws_region.current.name}" }
}

module "compute_subnet" {
  source            = "../modules/subnet"
  count             = var.azs_per_vpc
  subnet_iterator   = count.index
  subnet_name       = "compute"
  route_table_ids   = [aws_route_table.compute_subnet_route_table.id]
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 3, count.index + 0) # 512 IPs per subnet
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]
  vpc_id            = aws_vpc.main.id
  vpc_name          = var.vpc_name
}