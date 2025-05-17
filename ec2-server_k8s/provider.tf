terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "venkat-swan"
    key    = "Practice-Devops-EC2-K8S"
    region = "us-east-1"
    dynamodb_table = "venkat-db"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}