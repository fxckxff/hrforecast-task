# modules/s3/main.tf
resource "aws_s3_bucket" "eks_bucket" {
  bucket = "${var.tenant_name}-eks-bucket-vel-pletnov"

  tags = {
    Name    = "S3 Bucket for ${var.tenant_name}"
    Project = var.tenant_name
  }
}


