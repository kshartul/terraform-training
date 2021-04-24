variable "ami_string" {
    type = string
    default = "ami-0b1e2eeb33ce3d66f"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "aws_instance_azs" {
    type = string
    default = "us-west-2a"
}
variable "aws_instance_name" {
    type = string
    default = "example-5-module"
}

variable "aws_subnet_id"{
    type = string
} 