resource "aws_iam_policy" "build" {
  name   = "${var.projectname}-${var.env}-build-policy"
  policy = data.aws_iam_policy_document.build.json
  tags = {
    Environment = var.env
    Project     = var.projectname
  }
}

data "aws_iam_policy_document" "build" {
  statement {
    sid = "Logging"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["*"]
  }
  statement {
    sid = "EC2Network"
    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeDhcpOptions",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeVpcs"
    ]
    resources = ["*"]
  }
  statement {
    sid = "S3Access"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${var.s3_bucketname}",
      "arn:aws:s3:::${var.s3_bucketname}/*"
    ]
  }
  statement {
    sid = "CodePipeline"
    actions = [
      "codepipeline:StartPipelineExecution"
    ]
    resources = ["*"]
  }
}
