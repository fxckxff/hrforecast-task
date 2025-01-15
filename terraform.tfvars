# terraform.tfvars
tenant_name              = "tenant1"
aws_region               = "us-west-1"
cidr_block               = "10.0.0.0/16"
public_subnet_cidr       = "10.0.1.0/24"
private_subnet_cidr      = "10.0.2.0/24"
availability_zone        = "us-west-2a"
instance_types           = ["t3.micro"]
ami_type                 = "AL2_x86_64"
