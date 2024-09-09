variable "vpc_id" {
  type        = string
  description = "The ID of the VPC the subnet is being created in"
}

variable "vpc_name" {
  type        = string
  description = "The Name of the VPC the Subnet is being created in"
}

variable "subnet_name" {
  type        = string
  description = "The display name of the AWS Subnet"
}

variable "subnet_iterator" {
  type        = number
  description = "The index of the Subnet. When creating multiple subnets using the module, set this to 'count.index'. Otherwise set it to some other number (i.e. 0)"
}

variable "cidr_block" {
  type        = string
  description = "The CIDR Block assigned to the Subnet that's being created"

}

variable "availability_zone" {
  type        = string
  description = "The Availibility Zone to Assign to the Subnet"
}

variable "tags" {
  type        = map(any)
  description = "Tags to put on the resources created for this module"
  default     = {}
}

variable "route_table_ids" {
  type        = list(string)
  description = "List of Route Table IDs to associate to the Subnet being created"
}