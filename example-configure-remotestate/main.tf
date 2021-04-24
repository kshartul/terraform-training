terraform {
  backend "s3" {
    bucket = "sh01-terraform-remote"
    key    = "mystate/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "instance1" {
  ami = "ami-0a243dbef00e96192"
  instance_type = "t2.micro"
  availability_zone = "us-west-2a"
}

output "instance_id" {
  value = aws_instance.instance1.id
}

output "public_ip" {
  value = aws_instance.instance1.public_ip
}
