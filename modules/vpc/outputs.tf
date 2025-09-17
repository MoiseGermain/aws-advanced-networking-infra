output "hub_vpc_id" {
  value = aws_vpc.hub.id
}

output "spoke1_vpc_id" {
  value = aws_vpc.spoke1.id
}

output "spoke2_vpc_id" {
  value = aws_vpc.spoke2.id
}

output "hub_subnet_ids" {
  value = [aws_subnet.hub_public.id]
}

output "spoke1_subnet_ids" {
  value = [aws_subnet.spoke1_private.id]
}

output "spoke2_subnet_ids" {
  value = [aws_subnet.spoke2_private.id]
}

