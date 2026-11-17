terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "vasu-ecommerce-terraform-state-2026-unique"
    key          = "ecommerce/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}

# 1. Networking module
module "networking" {
  source = "../../modules/networking"

  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = var.enable_nat_gateway
}

# 2. IAM module
module "iam" {
  source = "../../modules/iam"

  environment  = var.environment
  cluster_name = var.cluster_name
}

# 3. EKS module
module "eks" {
  source = "../../modules/eks"

  environment         = var.environment
  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  cluster_role_arn    = module.iam.eks_cluster_role_arn
  node_role_arn       = module.iam.eks_node_role_arn
  private_subnet_ids  = module.networking.private_subnet_ids
  instance_types      = var.instance_types
  desired_size        = var.desired_size
  min_size            = var.min_size
  max_size            = var.max_size
  public_access_cidrs = var.public_access_cidrs

  depends_on = [module.iam]
}

# 4. RDS module
module "rds" {
  source = "../../modules/rds"

  environment                = var.environment
  database_name              = var.database_name
  username                   = var.db_username
  password                   = var.db_password
  private_subnet_ids         = module.networking.private_subnet_ids
  vpc_id                     = module.networking.vpc_id
  allowed_security_group_ids = [module.eks.cluster_security_group_id]
}
