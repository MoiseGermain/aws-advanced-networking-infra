# Root-level outputs
# VPC
output "hub_vpc_id" {
  description = "Hub VPC ID"
  value       = module.vpc.hub_vpc_id
}

output "spoke_vpc_ids" {
  description = "Spoke VPC IDs"
  value       = module.vpc.spoke_vpc_ids
}

# ALB
output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

# CloudFront
output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = module.cloudfront.cf_domain_name
}

# WAF
output "waf_arn" {
  description = "ARN of the WAF Web ACL"
  value       = module.waf.waf_arn
  condition   = var.enable_waf
}
