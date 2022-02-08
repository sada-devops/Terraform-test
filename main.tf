terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "vpc_test" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_test.id
  cidr_block = var.public_subnet
  availability_zone = var.az[0]
  tags = {
    Name = "${var.env}-subnet-1"
  }
}

resource "aws_internet_gateway" "public_igw" {
  vpc_id = aws_vpc.vpc_test.id
  tags = {
    Name = "${var.env}-igw"
  }
}

resource "aws_route_table" "publice-rt" {
  vpc_id = aws_vpc.vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_igw.id
  }

tags = {
  Name = "${var.env}-publicrt"
}
  
}

resource "aws_route_table_association" "public_RTA" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.publice-rt.id
}

resource "aws_security_group" "test_sg" {
  name = "test_sg"
  vpc_id = aws_vpc.vpc_test.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name =  "${var.env}-sg"
  }
}