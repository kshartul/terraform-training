variable "aws_region" {
    default = "us-west-2"
}
variable "instance_type" {
}
variable "aws_instance_name" {
    type = string
}
variable "aws_instance_azs" {
}
variable "ebs_azs" {
}
variable "volume_device_name" {
    type = string
}
