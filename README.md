# Cloud Resume Challenge with AWS CodeBuild and Terraform

This project demonstrates how to deploy a static resume website on AWS using Terraform, S3, CloudFront, and AWS CodeBuild for automated deployment.

---

## **Project Overview**

- **Static Resume Website:** Hosted on AWS S3 and delivered securely via CloudFront.
- **Automated Deployments:** AWS CodeBuild is triggered by GitHub webhooks to sync changes from your repository to S3.
- **CloudFront Cache Invalidation:** Lambda function automatically invalidates CloudFront cache when new content is uploaded to S3.
- **Infrastructure as Code:** All AWS resources are managed by Terraform for security, repeatability, and maintainability.

---

## **Architecture**

- **AWS S3:** Hosts the static website files.
- **AWS CloudFront:** Accelerates and secures website delivery.
- **AWS Lambda:** Automates CloudFront cache invalidation on S3 updates.
- **AWS CodeBuild:** Automatically syncs files from GitHub to S3 on every push.
- **AWS IAM:** Implements least privilege access for all resources.

---

## **Repository Structure**

cloud_resume_challenge_terraform/
├── main.tf                # Root module configuration
├── variables.tf           # Input variables
├── output.tf              # Output values
├── backend.tf             # Remote state configuration
├── modules/
│   ├── s3/                # S3 bucket and website resources
│   ├── invalidation_lambda/ # Lambda for CloudFront cache invalidation
│   └── codebuild/         # CodeBuild project for GitHub-to-S3 sync (optional)
└── README.md

---

## **Terraform Module Structure**

- **modules/s3:** S3 bucket, website, CloudFront, and related resources.
- **modules/invalidation_lambda:** Lambda function for CloudFront cache invalidation.
- **modules/codebuild:** AWS CodeBuild project for GitHub-to-S3 sync.

---

## **How It Works**

1. **Push to GitHub:** CodeBuild is triggered automatically via webhook.
2. **CodeBuild syncs files:** The build process runs `aws s3 sync` to copy files from your GitHub repo to your S3 bucket.
3. **S3 event triggers Lambda:** Lambda function invalidates CloudFront cache for instant updates.
4. **CloudFront serves content:** Visitors access your site securely and quickly via CloudFront.

---

## **Requirements**

- **AWS Account**: With sufficient permissions.
- **Terraform**: Installed and configured with AWS credentials.
- **GitHub OAuth Token**: For CodePipeline source stage (if using GitHub).

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

**Inspired by the [Cloud Resume Challenge](https://cloudresumechallenge.dev/) and community projects.**