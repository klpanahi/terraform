# Create EC2 instances
resource "aws_instance" "ubuntu_instance" {
  ami                         = data.aws_ami.ubuntu_ami.image_id
  instance_type               = "t3.medium"
  subnet_id                   = var.subnet
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = var.assign_public_ip
  key_name                    = var.key_name
  tags = {
    Name = var.instance_name
  }
}