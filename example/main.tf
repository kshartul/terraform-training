# Configure the AWS Provider
provider "aws" {
 region = "${var.region}" # "us-east-1"
 shared_credentials_file = "${var.shared_cred_file}"
 profile = "default"
}

resource "aws_instance" "with_eip" {
    count                  = 4 
    ami="ami-0742b4e673072066f" 
    instance_type = "t2.micro" 

 tags = {                                                  
     Name = "devOps ${count.index}"
  }
}