# outputs.tf
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnets
}

output "private_subnet_id" {
  value = module.vpc.private_subnets
}

output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

# output "s3_bucket_name" {
#   value = module.s3.bucket_name
# }

output "kms_key_id" {
  value = module.kms.kms_key_arn
}
