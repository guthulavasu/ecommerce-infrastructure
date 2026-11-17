
# RDS Database Endpoint
output "db_endpoint" {
  description = "RDS MySQL connection endpoint"
  value       = aws_db_instance.mysql.endpoint
}

# RDS Database Address
output "db_address" {
  description = "RDS MySQL hostname"
  value       = aws_db_instance.mysql.address
}

# RDS Database Port
output "db_port" {
  description = "RDS MySQL port"
  value       = aws_db_instance.mysql.port
}

# RDS Database Name
output "db_name" {
  description = "MySQL database name"
  value       = aws_db_instance.mysql.db_name
}

# RDS Security Group ID
output "rds_security_group_id" {
  description = "RDS security group ID"
  value       = aws_security_group.rds.id
}
