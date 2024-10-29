provider "aws" {
    region = "us-east-1"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
}
variable "vpc_cidr_block" {
  description = "vpc cidr block"
}
  
# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "development-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: "development",
    vcp_env: "dev"
  }
}
  
resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-1-dev"


  }
}
data "aws_vpc" "existing_vpc" {
  default = true
}


output "dev-vpc-id" {
  value = aws_vpc.development-vpc.id
}
output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}
