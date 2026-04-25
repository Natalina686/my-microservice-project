terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

   backend "s3" {
     bucket         = "nata-lesson5-tfstate-683966916235"
     key            = "lesson-5/terraform.tfstate"
     region         = "us-west-2"
     dynamodb_table = "terraform-locks"
     encrypt        = true
   }
}

provider "aws" {
  region = "us-west-2"
}