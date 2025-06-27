resource "aws_iam_role" "codebuild_role" {
  name = "${var.projectname}-${var.env}-codebuild-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "codebuild.amazonaws.com"
      }
    }]
  })
  tags = {
    Environment = var.env
    Project     = var.projectname
  }
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name = "${var.projectname}-${var.env}-codebuild-policy"
  role = aws_iam_role.codebuild_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = ["*"]
      },
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.s3_bucketname}",
          "arn:aws:s3:::${var.s3_bucketname}/*"
        ]
      }
    ]
  })
}

resource "aws_codebuild_project" "github_to_s3" {
  name          = "${var.projectname}-${var.env}-github-to-s3"
  description   = "Sync GitHub repo to S3"
  build_timeout = 5
  service_role  = aws_iam_role.codebuild_role.arn

  source {
    type      = "GITHUB"
    location  = "https://github.com/${var.repo_owner}/${var.repo_name}.git"
    buildspec = "buildspec.yml"
    auth {
      type     = "OAUTH"
      resource = var.github_oauth_token
    }
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:7.0"
    type         = "LINUX_CONTAINER"
    environment_variable {
      name  = "S3_BUCKET_NAME"
      value = var.s3_bucketname
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "${var.projectname}-${var.env}-build-stream"
      stream_name = "log-stream"
    }
  }

  tags = {
    Environment = var.env
    Project     = var.projectname
  }
}

resource "aws_codebuild_webhook" "github_webhook" {
  project_name = aws_codebuild_project.github_to_s3.name
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }
    filter {
      type    = "HEAD_REF"
      pattern = "refs/heads/${var.repo_branch}"
    }
  }
}
