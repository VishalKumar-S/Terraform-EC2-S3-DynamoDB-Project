terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
  backend "s3" {
    bucket         = "165617766510-terraform-states"
    key            = "terraform-project/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    # You can add the kms_key_id and dynamodb_table settings here if needed.
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Project"
  }
}
