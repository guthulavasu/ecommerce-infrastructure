
# EKS Cluster Name
output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

# EKS Cluster Endpoint
output "cluster_endpoint" {
  description = "Endpoint of the EKS Kubernetes API server"
  value       = aws_eks_cluster.main.endpoint
}

# EKS Certificate Authority
output "cluster_certificate_authority" {
  description = "Certificate authority data for EKS"
  value       = aws_eks_cluster.main.certificate_authority[0].data
  sensitive   = true
}

# EKS Cluster ARN
output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = aws_eks_cluster.main.arn
}

# EKS Node Group ARN
output "node_group_arn" {
  description = "ARN of the managed node group"
  value       = aws_eks_node_group.main.arn
}

# EKS Node Group Status
output "node_group_status" {
  description = "Status of the managed node group"
  value       = aws_eks_node_group.main.status
}
output "cluster_security_group_id" {
  description = "EKS cluster security group ID"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}