# Root-level variables
variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "phase3-advanced-networking"
}

# -----------------
# VPC (Hub + Spokes)
# -----------------
variable "hub_vpc_cidr" {
  description = "CIDR block for the Hub VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "spoke1_vpc_cidr" {
  description = "CIDR block for Spoke 1 VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "spoke2_vpc_cidr" {
  description = "CIDR block for Spoke 2 VPC"
  type        = string
  default     = "10.2.0.0/16"
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# -----------------
# ALB
# -----------------
variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
  default     = "phase3-alb"
}

variable "alb_internal" {
  description = "Whether the ALB is internal or internet-facing"
  type        = bool
  default     = false
}

# -----------------
# CloudFront
# -----------------
variable "cf_price_class" {
  description = "Price class for CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}

# -----------------
# WAF
# -----------------
variable "enable_waf" {
  description = "Enable WAF protection"
  type        = bool
  default     = true
}
