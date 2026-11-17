
# 1. RDS Security Group
resource "aws_security_group" "rds" {
  name        = "ecommerce-${var.environment}-rds-sg"
  description = "Allow MySQL traffic from approved application sources"
  vpc_id      = var.vpc_id

  ingress {
    description = "MySQL access from private application subnets"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"

    security_groups = var.allowed_security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ecommerce-${var.environment}-rds-sg"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# 2. RDS DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "ecommerce-${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "ecommerce-${var.environment}-db-subnet-group"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# 3. Amazon RDS MySQL Instance
resource "aws_db_instance" "mysql" {
  identifier = "ecommerce-${var.environment}-mysql"

  engine                = "mysql"
  engine_version        = "8.0.46"
  instance_class        = var.instance_class
  allocated_storage     = 20
  max_allocated_storage = 50
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = var.database_name
  username = var.username
  password = var.password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible = false

  multi_az                  = false
  backup_retention_period   = 1
  deletion_protection       = true
  skip_final_snapshot       = false
  final_snapshot_identifier = "ecommerce-${var.environment}-mysql-final"

  tags = {
    Name        = "ecommerce-${var.environment}-mysql"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
