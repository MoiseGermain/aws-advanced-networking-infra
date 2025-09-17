variable "alb_dns_name" {
  type        = string
  description = "DNS name of the Application Load Balancer"
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for CloudFront distribution"
}

variable "waf_acl_arn" {
  description = "Optional WAFv2 Web ACL ARN to associate with this CloudFront distribution"
  type        = string
  default     = null
}


