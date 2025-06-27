output "s3_bucket_name" {
  value       = module.s3.s3_bucket_id
  description = "Name of the S3 bucket for website content"
}

output "cloudfront_domain_name" {
  value       = module.s3.cloudfront_domainname
  description = "Domain name of the CloudFront distribution"
}

output "cloudfront_distribution_id" {
  value       = module.s3.aws_cloudfront_distribution_id
  description = "ID of the CloudFront distribution"
}

output "s3_bucket_arn" {
  value       = module.s3.s3_bucket_arn
  description = "ARN of the S3 bucket"
}

# If you want to expose the S3 website URL (optional, but usually CloudFront is preferred)
# output "s3_static_website_url" {
#   value       = module.s3.s3_static_website_url
#   description = "S3 static website URL (HTTP only)"
# }
