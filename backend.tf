# backend.tf
terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-vel-pletnov"
    key    = "terraform/tfstate/terraform.tfstate"
    region = "us-west-1"
  }
}
