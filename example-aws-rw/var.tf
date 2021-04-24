
variable "aws_region" {
    
}

variable "aws_public_azs" {

}

variable "aws_cidrs_mgmt" {

}

variable "secGroupName" {
    type = string
    default = "allow_http_ssh"
}

variable "secGroupDescription" {
    type = string
    default = "Allow HTTP and TLS inbound traffic"
}
