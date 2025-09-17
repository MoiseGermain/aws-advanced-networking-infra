########################################
# Transit Gateway
########################################
resource "aws_ec2_transit_gateway" "this" {
  description = "Hub-and-Spoke Transit Gateway"
  amazon_side_asn = 64512

  tags = {
    Name = "hub-spoke-tgw"
  }
}

########################################
# Attach Hub VPC
########################################
resource "aws_ec2_transit_gateway_vpc_attachment" "hub" {
  subnet_ids         = var.hub_subnet_ids
  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.hub_vpc_id

  tags = {
    Name = "hub-tgw-attachment"
  }
}

########################################
# Attach Spoke 1 VPC
########################################
resource "aws_ec2_transit_gateway_vpc_attachment" "spoke1" {
  subnet_ids         = var.spoke1_subnet_ids
  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.spoke1_vpc_id

  tags = {
    Name = "spoke1-tgw-attachment"
  }
}

########################################
# Attach Spoke 2 VPC
########################################
resource "aws_ec2_transit_gateway_vpc_attachment" "spoke2" {
  subnet_ids         = var.spoke2_subnet_ids
  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.spoke2_vpc_id

  tags = {
    Name = "spoke2-tgw-attachment"
  }
}

