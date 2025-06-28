variable "s3_bucketname" {
  description = "Name of the S3 bucket"
}
variable region {
  type        = string
  description = "The AWS region"
}

variable projectname {
  type        = string
  description = "The name of the project"
}

variable env {
  type        = string
  description = "The name of the environment"
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate"
}

variable "aliases" {
  type        = list(string)
  description = "List of domain aliases for CloudFront"
  default     = []
}