# Create AWS Developer Tools CI/CD Pipeline for Deploying the Cloud Resume Challenge Portfolio

This project uses Terraform to deploy a complete AWS CI/CD pipeline for the Cloud Resume Challenge, including S3 static website hosting, CloudFront distribution, Lambda-based CloudFront invalidation, and managed deployment workflows via AWS CodePipeline and CodeBuild.

---

## **Overview**

- **S3 Static Website**: Hosts the portfolio/resume website.
- **CloudFront**: Accelerates and secures website delivery.
- **Lambda Function**: Automatically invalidates CloudFront cache on S3 updates.
- **CodePipeline/CodeBuild**: Automated build and deployment pipeline with manual approval.

---

## **Initialise and Deploy**

To deploy the infrastructure:

```sh
$ terraform init
$ terraform plan
$ terraform apply
```

---

## **Destroy the Infrastructure**

To remove all deployed resources:

```sh
$ terraform destroy
```

---

## **Project Structure**

- **main.tf**: Root module configuration, includes provider and module calls.
- **variables.tf**: Input variables for project, environment, and AWS details.
- **output.tf**: Outputs such as S3 website URL and CloudFront domain.
- **modules/s3**: S3 bucket, website, CloudFront, and related resources.
- **modules/invalidation_lambda**: Lambda function for CloudFront cache invalidation.
- **modules/developerTools**: AWS CodePipeline, CodeBuild, and IAM resources.

---

## **Requirements**

- **AWS Account**: With sufficient permissions.
- **Terraform**: Installed and configured with AWS credentials.
- **GitHub OAuth Token**: For CodePipeline source stage (if using GitHub).

