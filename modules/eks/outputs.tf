output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "node_group_1_name" {
  value = aws_eks_node_group.node_group_1.node_group_name
}

output "node_group_2_name" {
  value = aws_eks_node_group.node_group_2.node_group_name
}
