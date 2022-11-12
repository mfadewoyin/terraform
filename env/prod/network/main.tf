terraform {
  required_version = "~> 1.3.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

provider "aws" {
  profile    = "default"
  access_key = ""
  secret_key = ""
  region     = "us-west-2"
}

locals {
  tag_name        = "mojisola"
  tag_environment = "production"
}

data "aws_region" "current" {}

module "vpc" {
  source = "../../../modules/vpc"


  tag_name                 = local.tag_name
  tag_environment          = local.tag_environment
  vpc_cidr_block           = var.vpc_cidr_block
  vpc_instance_tenancy     = var.vpc_instance_tenancy
  vpc_enable_dns_support   = var.vpc_enable_dns_support
  vpc_enable_dns_hostnames = var.vpc_enable_dns_hostnames
}
