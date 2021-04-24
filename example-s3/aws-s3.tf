# Configure the AWS Provider
provider "aws" {
 region = "${var.region}"
 shared_credentials_file = "${var.shared_cred_file}"
 profile = "default"
}

resource "aws_s3_bucket" "b1" {
  bucket = "sha01-bucket"
  acl    = "private" 


versioning {
    enabled = true
}
  tags = {
    Name        = "sh01-mybucket"
    Environment = "Dev"
  }
}
