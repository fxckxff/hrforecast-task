# variables.tf
variable "tenant_name" {
  description = "Название клиента (тенанта)"
  type        = string
}

variable "aws_region" {
  description = "Регион AWS"
  default     = "us-west-2"
}

variable "cidr_block" {
  description = "CIDR блок для VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR блок для публичной подсети"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR блок для приватной подсети"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Зона доступности для подсетей"
  default     = "us-west-2a"
}

variable "instance_types" {
  description = "Типы инстансов для worker групп"
  default     = ["t3.micro"]
}

variable "ami_type" {
  description = "Тип AMI для worker групп"
  default     = "AL2_x86_64"
}
