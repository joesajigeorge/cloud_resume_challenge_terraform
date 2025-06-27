variable "projectname" {
  type        = string
  description = "The name of the project"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "The name of the environment"
}

variable "awsprofile" {
  type        = string
  description = "AWS profile configured in the system"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The AWS region"
}

variable "s3_bucketname" {
  type        = string
  description = "Name of the S3 bucket for website content"
}

# GitHub integration variables for CodeBuild
variable "repo_owner" {
  type        = string
  description = "GitHub repository owner"
}

variable "repo_name" {
  type        = string
  description = "GitHub repository name"
}

variable "repo_branch" {
  type        = string
  description = "GitHub repository branch"
}

variable "github_oauth_token" {
  type        = string
  description = "GitHub OAuth token"
  sensitive   = true
}
