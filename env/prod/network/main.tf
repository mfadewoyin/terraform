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
  access_key = "AKIASTZ63KU7EHCQKB7K"
  secret_key = "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"
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

module "subnet_public" {
  source = "../../../modules/subnets"

  subnet_cidr_block        = var.subnet_cidr_block.subnet_public
  vpc_id                   = module.vpc.vpc_id
  subnet_availability_zone = "${data.aws_region.current.name}a"
  map_public_ip_on_launch  = var.map_public_ip_on_launch.subnet_public
  tag_name                 = local.tag_name
  tag_environment          = local.tag_environment

}

module "subnet_private" {
  source = "../../../modules/subnets"

  subnet_cidr_block        = var.subnet_cidr_block.subnet_private
  vpc_id                   = module.vpc.vpc_id
  subnet_availability_zone = "${data.aws_region.current.name}a"
  map_public_ip_on_launch  = var.map_public_ip_on_launch.subnet_private
  tag_name                 = local.tag_name
  tag_environment          = local.tag_environment

}

module "internetgateway" {
  source = "../../../modules/internetgateway"

  tag_name        = local.tag_name
  tag_environment = local.tag_environment
  vpc_id          = module.vpc.vpc_id


}

module "eip" {
  source = "../../../modules/eip"
  vpc    = var.vpc

}

module "nat" {
  source = "../../../modules/nat"

  allocation_id   = module.eip.eip_id
  subnet_id       = module.subnet_private.subnet_id
  tag_name        = local.tag_name
  tag_environment = local.tag_environment
}

module "route_table_private" {
  source = "../../../modules/routetables"

  vpc_id          = module.vpc.vpc_id
  tag_name        = local.tag_name
  tag_environment = local.tag_environment
}
module "route_table_public" {
  source = "../../../modules/routetables"

  vpc_id          = module.vpc.vpc_id
  tag_name        = local.tag_name
  tag_environment = local.tag_environment
}

module "route_private" {
  source = "../../../modules/route-private"

  route_table_id         = module.route_table_private.route_table_id
  destination_cidr_block = var.route_cidr_block.subnet_private
  nat_gateway_id         = module.nat.nat_gateway_id


}

module "route_public" {
  source = "../../../modules/route-public"

  route_table_id         = module.route_table_private.route_table_id
  destination_cidr_block = var.route_cidr_block.subnet_public
  gateway_id             = module.internetgateway.internet_gateway_id

}
module "route_table_association_private" {
  source = "../../../modules/route-table-association"

  subnet_id      = module.subnet_private.subnet_id
  route_table_id = module.route_table_private.route_table_id

}

module "route_table_association_public" {
  source = "../../../modules/route-table-association"


  subnet_id      = module.subnet_private.subnet_id
  route_table_id = module.route_table_private.route_table_id
}

module "securitygroup" {
  source = "../../../modules/securitygroup"


  security_group_name = var.security_group_name
  vpc_id              = module.vpc.vpc_id
  tag_environment     = local.tag_environment
}

module "elb" {
  source = "../../../modules/elb"


  elb_name          = var.elb_name
  availability_zone = ["${data.aws_region.current.name}a"]
  tag_environment   = local.tag_environment
}
