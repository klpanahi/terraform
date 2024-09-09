variable "azs_per_vpc" {
  description = "How many Availibility Zones will we use per subnet per vpc"
  type        = string
  default     = 1
  validation {
    condition     = var.azs_per_vpc <= 3
    error_message = "Cannot use more than 3 AZs per region/VPC"
  }
  validation {
    condition     = var.azs_per_vpc > 0
    error_message = "Must use at least 1 AZ for a region/VPC"
  }
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "ec2_ssh_key_name" {
  description = "The name of the key pair to use for SSHing to the provisioned EC2 Instances"
  type        = string
}