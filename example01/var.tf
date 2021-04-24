variable "aws_region" {
    default = "us-west-2"
}
variable "vpc_cidr" {
	default = "10.20.0.0/16"
}
variable "aws_vpc_name" {
    type = string
}
variable "subnets_cidr" {
	type = list(string)
	default = ["10.20.1.0/24","10.20.2.0/24"]
}
variable "azs" {
	type = list(string)
}
variable "aws_igw_name" {
    type = string
}
variable "aws_rt_name" {
    default = "Demo_rt"
}
variable "ami-string" {
    type = string
}
variable "instance_type" {
}
variable "aws_instance_azs" {
    type = string
}
variable "aws_instance_name" {
    type = string
}
variable "ebs_azs" {
    default = "us-west-2a"
}
variable "volume_device_name1" {
    type = string
}
variable "volume_device_name2" {
    type = string
}
