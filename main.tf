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