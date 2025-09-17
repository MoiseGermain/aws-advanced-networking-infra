# Root configuration (calls modules)
#######################################################
# Root main.tf – Phase 3: Advanced Networking Infra
#######################################################

provider "aws" {
  region = "us-east-1"
}

#######################################################
# Networking (Hub + Spokes)
#######################################################
module "vpc" {
  source = "./modules/vpc"

  hub_vpc_cidr = "10.0.0.0/16"

  spoke_vpcs = {
    spoke1 = "10.1.0.0/16"
    spoke2 = "10.2.0.0/16"
  }

  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24"]
}

#######################################################
# Application Load Balancer (in Hub VPC)
#######################################################
module "alb" {
  source             = "./modules/alb"
  vpc_id             = module.vpc.hub_vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
}

#######################################################
# Web Application Firewall (WAFv2)
#######################################################
module "waf" {
  source = "./modules/waf"

  rules = [
    {
      name     = "AWSManagedRulesCommonRuleSet"
      priority = 1
      override_action = {
        none = {}
      }
      statement = {
        managed_rule_group_statement = {
          name        = "AWSManagedRulesCommonRuleSet"
          vendor_name = "AWS"
        }
      }
      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "awsCommonRules"
        sampled_requests_enabled   = true
      }
    }
  ]
}

#######################################################
# CloudFront Distribution (with optional WAF)
#######################################################
module "cloudfront" {
  source       = "./modules/cloudfront"
  alb_dns_name = module.alb.dns_name
  waf_acl_arn  = module.waf.waf_acl_arn
}

#######################################################
# Outputs
#######################################################
output "hub_vpc_id" {
  value = module.vpc.hub_vpc_id
}

output "alb_dns_name" {
  value = module.alb.dns_name
}

output "cloudfront_domain_name" {
  value = module.cloudfront.cloudfront_domain_name
}

output "waf_acl_arn" {
  value = module.waf.waf_acl_arn
}
