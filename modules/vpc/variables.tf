variable "hub_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the Hub VPC"
}

variable "spoke1_cidr" {
  type        = string
  default     = "10.1.0.0/16"
  description = "CIDR block for Spoke 1 VPC"
}

variable "spoke2_cidr" {
  type        = string
  default     = "10.2.0.0/16"
  description = "CIDR block for Spoke 2 VPC"
}

