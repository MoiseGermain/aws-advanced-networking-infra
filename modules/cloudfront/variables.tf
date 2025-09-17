variable "alb_dns_name" {
  type        = string
  description = "DNS name of the Application Load Balancer"
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for CloudFront distribution"
}

variable "waf_acl_arn" {
  type        = string
  description = "ARN of the WAF ACL to associate with CloudFront (optional)"
  default     = ""
}

