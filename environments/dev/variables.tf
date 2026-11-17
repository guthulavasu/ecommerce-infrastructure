variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "DEV VPC CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.10.11.0/24", "10.10.12.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = false
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "ecommerce-dev-eks"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.33"
}

variable "instance_types" {
  description = "EKS worker node instance types"
  type        = list(string)
  default     = ["t3.small"]
}

variable "desired_size" {
  description = "Desired worker nodes"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "Minimum worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum worker nodes"
  type        = number
  default     = 2
}

variable "public_access_cidrs" {
  description = "Trusted public IP CIDRs for EKS API access"
  type        = list(string)
  default     = ["127.0.0.1/32"]
}

variable "database_name" {
  description = "MySQL database name"
  type        = string
  default     = "ecommerce"
}

variable "db_username" {
  description = "MySQL master username"
  type        = string
  default     = "ecommerceadmin"
}

variable "db_password" {
  description = "MySQL master password"
  type        = string
  sensitive   = true
}