variable "hub_vpc_id" {
  type        = string
  description = "Hub VPC ID"
}

variable "spoke1_vpc_id" {
  type        = string
  description = "Spoke 1 VPC ID"
}

variable "spoke2_vpc_id" {
  type        = string
  description = "Spoke 2 VPC ID"
}

variable "hub_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for Hub VPC"
}

variable "spoke1_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for Spoke 1 VPC"
}

variable "spoke2_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for Spoke 2 VPC"
}

