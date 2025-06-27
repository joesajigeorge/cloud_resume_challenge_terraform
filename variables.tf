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
  description = "Name of the S3 bucket"
  validation {
    condition     = length(var.s3_bucketname) > 3
    error_message = "Bucket name must be >3 chars"
  }
}

variable "pipeline_artifact_bucket_name" {
  type        = string
  description = "Name of the pipeline artifact S3 bucket"
  validation {
    condition     = length(var.pipeline_artifact_bucket_name) > 3
    error_message = "Bucket name must be >3 chars"
  }
}

variable "github_oauth_token" {
  type        = string
  description = "Github oauth token"
  sensitive   = true
}

variable "repo_owner" {
  type        = string
  description = "Repository owner"
}

variable "repo_name" {
  type        = string
  description = "Repository name"
}

variable "repo_branch" {
  type        = string
  description = "Repository branch"
}

variable "poll_source_changes" {
  type        = bool
  description = "Poll source changes"
  default     = false
}

variable "repo_url" {
  type        = string
  description = "Repository url"
}

variable "code_start_connection_arn" {
  type        = string
  description = "Code start connection arn"
}

variable "repo_id" {
  type        = string
  description = "Repository id"
}
