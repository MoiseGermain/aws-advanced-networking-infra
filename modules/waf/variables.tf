variable "name" {
  description = "Name of the WAF Web ACL"
  type        = string
}

variable "scope" {
  description = "Scope of the WAF (CLOUDFRONT or REGIONAL)"
  type        = string
  default     = "CLOUDFRONT"
}

variable "tags" {
  description = "Tags to apply to the WAF Web ACL"
  type        = map(string)
  default     = {}
}
