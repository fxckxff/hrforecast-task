variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for subnets"
  type        = string
}

variable "tenant_name" {
  description = "Tenant name for resource tagging"
  type        = string
}

variable "region" {
  description = "AWS Region to deploy resources"
  type        = string
  default     = "us-west-1"
}
