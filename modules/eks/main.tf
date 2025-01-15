# modules/eks/main.tf
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.tenant_name}-cluster"
  role_arn = aws_iam_role.node_group_role.arn

  vpc_config {
    subnet_ids = concat(var.private_subnet_ids, var.public_subnet_ids)
  }

  encryption_config {
    provider {
      key_arn = var.kms_key_arn
    }
    resources = ["secrets"]
  }

  tags = {
    Name    = "EKS Cluster for ${var.tenant_name}"
    Project = var.tenant_name
  }
}

resource "aws_iam_role" "node_group_role" {
  name = "${var.tenant_name}-eks-node-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect    = "Allow"
      }
    ]
  })
}

resource "aws_eks_node_group" "node_group_1" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.tenant_name}-node-group-1"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = var.private_subnet_ids
  ami_type        = "AL2_x86_64"
  instance_types  = ["t3.micro"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  disk_size = 20
}

resource "aws_eks_node_group" "node_group_2" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.tenant_name}-node-group-2"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = var.public_subnet_ids
  ami_type        = "AL2_x86_64"
  instance_types  = ["t3.micro"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  disk_size = 20
}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}
