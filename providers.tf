terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["C:/Users/Rajat/.aws/config"]
  shared_credentials_files = ["C:/Users/Rajat/.aws/credentials"]
  profile                  = "default"
}