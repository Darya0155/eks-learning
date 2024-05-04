
resource "aws_vpc" "eks_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  tags = {
    Name = "aws_mks_connect_demo_VPC"
  }
  enable_dns_hostnames = true

}


resource "aws_subnet" "eks_vpc_subnet_1" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "aws_mks_connect_demo_subnet_public_2"
  }
}

resource "aws_subnet" "eks_vpc_subnet_2" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "aws_mks_connect_demo_subnet_public_1"
  }
}



resource "aws_internet_gateway" "aws_mks_connect_demo_gateway" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "main_gw"
  }

}





resource "aws_route" "aws_mks_connect_demo_default_routetable" {
  route_table_id            = aws_vpc.eks_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.aws_mks_connect_demo_gateway.id
}