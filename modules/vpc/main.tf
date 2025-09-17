########################################
# Hub VPC
########################################
resource "aws_vpc" "hub" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "hub-vpc"
  }
}

resource "aws_subnet" "hub_public" {
  vpc_id            = aws_vpc.hub.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "hub-public-subnet"
  }
}

########################################
# Spoke 1 VPC
########################################
resource "aws_vpc" "spoke1" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "spoke1-vpc"
  }
}

resource "aws_subnet" "spoke1_private" {
  vpc_id            = aws_vpc.spoke1.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "spoke1-private-subnet"
  }
}

########################################
# Spoke 2 VPC
########################################
resource "aws_vpc" "spoke2" {
  cidr_block           = "10.2.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "spoke2-vpc"
  }
}

resource "aws_subnet" "spoke2_private" {
  vpc_id            = aws_vpc.spoke2.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "spoke2-private-subnet"
  }
}

########################################
# Data source
########################################
data "aws_availability_zones" "available" {}

