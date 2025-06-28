provider "aws" {
  profile = var.awsprofile
  region  = var.region
}

module "staticweb" {
  source         = "./modules/staticweb"
  env            = var.env
  region         = var.region
  projectname    = var.projectname
  s3_bucketname  = var.s3_bucketname
  acm_certificate_arn = var.acm_certificate_arn
  aliases = var.domain_alias
}

module "route53" {
  source = "./modules/route53"
  depends_on = [module.staticweb] 

  domain_name              = var.domain_name
  cloudfront_domain_name   = module.staticweb.cloudfront_domainname
}


module "lambda_trigger" {
  depends_on = [module.staticweb]
  source     = "./modules/invalidation_lambda"
  env        = var.env
  region     = var.region
  projectname = var.projectname
  s3_bucket_id = module.staticweb.s3_bucket_id
  s3_bucket_arn = module.staticweb.s3_bucket_arn
  aws_cloudfront_distribution_id = module.staticweb.aws_cloudfront_distribution_id
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
