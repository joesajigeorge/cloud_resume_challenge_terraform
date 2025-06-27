variable "projectname" {
  type        = string
  description = "The name of the project"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "The name of the environment"
}

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

variable "s3_bucketname" {
  type        = string
  description = "S3 bucket name to sync files to"
}
