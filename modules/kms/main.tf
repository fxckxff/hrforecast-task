# modules/kms/main.tf
resource "aws_kms_key" "worker_key" {
  description = "KMS key for worker node encryption"
  is_enabled  = true
  enable_key_rotation = true

  tags = {
    Name    = "KMS Key for ${var.tenant_name}"
    Project = var.tenant_name
  }
}


