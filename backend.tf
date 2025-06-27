terraform {
  backend "s3" {
    bucket = "tfstatejoesajigeorge"
    key    = "portfolio/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    profile = "myaccount"
  }
}
