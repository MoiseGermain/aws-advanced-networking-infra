########################################
# Origin Access Control (OAC) for ALB
########################################
resource "aws_cloudfront_origin_access_control" "this" {
  name                              = "alb-oac"
  description                       = "Access control for ALB origin"
  origin_access_control_origin_type = "custom"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

########################################
# CloudFront Distribution
########################################
resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name = var.alb_dns_name
    origin_id   = "alb-origin"

    custom_origin_config {
      origin_protocol_policy = "https-only"
      http_port              = 80
      https_port             = 443
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  default_root_object = ""

  default_cache_behavior {
    target_origin_id       = "alb-origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # Optional WAF association
  dynamic "web_acl_id" {
    for_each = var.waf_acl_arn != null ? [var.waf_acl_arn] : []
    content {
      web_acl_id = web_acl_id.value
    }
  }
}
