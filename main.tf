# main.tf
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = var.cidr_block
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone    = var.availability_zone
  tenant_name          = var.tenant_name
}

module "kms" {
  source      = "./modules/kms"
  tenant_name = var.tenant_name
}

# module "s3" {
#   source      = "./modules/s3"
#   tenant_name = var.tenant_name
#   bucket_name = "${var.tenant_name}-shared-bucket"
# }

module "eks" {
  source            = "./modules/eks"
  tenant_name       = var.tenant_name
  kms_key_arn       = module.kms.kms_key_arn
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnets
  private_subnet_ids = module.vpc.private_subnets
  #s3_bucket_name   = module.s3.s3_bucket_name
}


# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "terraform-state-bucket-vel-pletnov"

#   tags = {
#     Name        = "Terraform State Bucket"
#     Environment = "dev"
#   }
# }
# resource "aws_s3_bucket" "bucket" {
#   bucket = "${var.tenant_name}-bucket"
#   tags = {
#     Name        = "${var.tenant_name}-bucket"
#     Environment = "dev"
#   }
# }
