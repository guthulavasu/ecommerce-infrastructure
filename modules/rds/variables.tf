
variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "database_name" {
  description = "MySQL database name"
  type        = string
  default     = "ecommerce"
}

variable "username" {
  description = "Master database username"
  type        = string
}

variable "password" {
  description = "Master database password"
  type        = string
  sensitive   = true
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for RDS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where RDS will be deployed"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}
variable "allowed_security_group_ids" {
  description = "Security groups allowed to connect to RDS"
  type        = list(string)
}