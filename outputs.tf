output "s3_bucket_name" {
  value       = module.staticweb.s3_bucket_id
  description = "Name of the S3 bucket for website content"
}

output "cloudfront_domain_name" {
  value       = module.staticweb.cloudfront_domainname
  description = "Domain name of the CloudFront distribution"
}

output "cloudfront_distribution_id" {
  value       = module.staticweb.aws_cloudfront_distribution_id
  description = "ID of the CloudFront distribution"
}

output "s3_bucket_arn" {
  value       = module.staticweb.s3_bucket_arn
  description = "ARN of the S3 bucket"
}

