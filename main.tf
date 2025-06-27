provider "aws" {
  profile = var.awsprofile
  region  = var.region
}

module "s3" {
  source         = "./modules/s3"
  env            = var.env
  region         = var.region
  projectname    = var.projectname
  s3_bucketname  = var.s3_bucketname
}

module "lambda_trigger" {
  depends_on = [module.s3]
  source     = "./modules/invalidation_lambda"
  env        = var.env
  region     = var.region
  projectname = var.projectname
  s3_bucket_id = module.s3.s3_bucket_id
  s3_bucket_arn = module.s3.s3_bucket_arn
  aws_cloudfront_distribution_id = module.s3.aws_cloudfront_distribution_id
}

module "codebuild" {
  source              = "./modules/codebuild"
  projectname         = var.projectname
  env                 = var.env
  repo_owner          = var.repo_owner
  repo_name           = var.repo_name
  repo_branch         = var.repo_branch
  github_oauth_token  = var.github_oauth_token
  s3_bucketname       = var.s3_bucketname
}
