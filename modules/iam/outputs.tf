
# EKS Cluster Role ARN
output "eks_cluster_role_arn" {
  description = "IAM role ARN for EKS control plane"
  value       = aws_iam_role.eks_cluster.arn
}

# EKS Worker Node Role ARN
output "eks_node_role_arn" {
  description = "IAM role ARN for EKS worker nodes"
  value       = aws_iam_role.eks_node.arn
}

# EKS Cluster Role Name
output "eks_cluster_role_name" {
  description = "IAM role name for EKS control plane"
  value       = aws_iam_role.eks_cluster.name
}

# EKS Worker Node Role Name
output "eks_node_role_name" {
  description = "IAM role name for EKS worker nodes"
  value       = aws_iam_role.eks_node.name
}
