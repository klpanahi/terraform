## The Kube Admin will also double as a bastion host
module "admin_node" {
  source           = "../modules/aws_ubuntu_ec2"
  instance_name    = "Admin-EC2"
  assign_public_ip = true
  subnet           = module.compute_subnet[0].subnet_id
  security_groups  = [aws_security_group.allow_ssh.id]
  key_name         = var.ec2_ssh_key_name
}

module "worker_node" {
  source          = "../modules/aws_ubuntu_ec2"
  count           = var.azs_per_vpc - 1
  instance_name   = "Worker-EC2-${count.index}"
  subnet          = module.compute_subnet[(count.index + 1) % var.azs_per_vpc].subnet_id
  security_groups = [aws_security_group.allow_ssh.id]
  key_name        = var.ec2_ssh_key_name
}