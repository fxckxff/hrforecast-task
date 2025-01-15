variable "tenant_name" {
  description = "Tenant name for resource tagging"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS Key ARN for encrypting worker nodes"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs of public subnets"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs of private subnets"
  type        = list(string)
}
