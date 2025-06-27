resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  depends_on = [aws_lambda_permission.allow_bucket]
  bucket     = var.s3_bucket_id
  lambda_function {
    lambda_function_arn = aws_lambda_function.main.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}
