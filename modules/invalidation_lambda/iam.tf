resource "aws_iam_role" "lambda_default" {
  name = "iam_for_lambda_${var.projectname}_${var.env}"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
  tags = {
    Environment = var.env
    Project     = var.projectname
  }
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    effect = "Allow"
  }
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_default.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_iam_policy" "lambda_policy" {
  name   = "${var.projectname}-${var.env}-lambda-policy"
  policy = data.aws_iam_policy_document.lambda_policy_doc.json
  tags = {
    Environment = var.env
    Project     = var.projectname
  }
}

data "aws_iam_policy_document" "lambda_policy_doc" {
  statement {
    sid = ""
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "cloudfront:CreateInvalidation"
    ]
    resources = ["*"]
    effect    = "Allow"
  }
}
