provider "aws" {
  region = var.aws_region
}


module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"
  
  ami = data.aws_ami.ubuntu.id  #"ami-0b1e2eeb33ce3d66f" #var.ami_name
  instance_count = var.instance_count
  associate_public_ip_address = var.req_public_ip
  instance_type = var.instance_type
  name = var.aws_instance_name
  private_ip = ""
  user_data = "" 
  vpc_security_group_ids =  data.aws_security_groups.test.ids   #["sg-177e4d2a"] #var.sec_group_id
  subnet_id = var.subnet_id
}
