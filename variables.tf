#default region
variable "aws_region" {
    default = "ap-south-1"
    type = string
}
variable "az" {
    description = "default aws region"
    type = list(string)
}

#vpc cidr block
variable "vpc_cidr_block" {
    description = "cidr blocks for vpc"
    type = string
    default = "10.0.0.0/16"
}

variable "public_subnet" {
    description = "public subnet cidr"
    type = string
    default = "10.0.1.0/24"
}

variable "env" {
    description = "environment to deploy"
}