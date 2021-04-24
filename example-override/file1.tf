provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "example1" {
  ami = "ami-04e59c05167ea7bd5"
  instance_type = "t2.small"

  depends_on = [aws_s3_bucket.b1]
}

resource "aws_s3_bucket" "b1" {
  bucket = "terraform-b1"
  acl    = "private"
}
