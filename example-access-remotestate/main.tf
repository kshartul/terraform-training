terraform {
  backend "s3" {
    bucket = "sh01-terraform-remote"
    key    = "mystate-1/terraform.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "remote1" {
  backend = "s3"
  config = {
    bucket = "sh01-terraform-remote"
    key    = "mystate/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}   

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.ebs_azs
  size              = 10 
}

resource "aws_volume_attachment" "name" {
  device_name = var.volume_device_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = data.terraform_remote_state.remote1.outputs.instance_id 
  # terraform_remote_state data source is fetching ec2 instance id from "mystate/terraform.tfstate"
}

