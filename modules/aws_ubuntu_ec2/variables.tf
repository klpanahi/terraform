variable "instance_name" {
  description = "Name of the EC2 Instance"
  type        = string
}

variable "assign_public_ip" {
  description = "Set this to True if you want the EC2 instance to have a public IP Assigned to it"
  default     = false
  type        = bool
}

variable "security_groups" {
  description = "List of security groups IDs assigned to the EC2 Instance"
  type        = list(string)
}

variable "subnet" {
  description = "The ID of the Subnet the EC2 will be deplyed in"
  type        = string
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance"
  type        = string
}