output "rds_instance_id" {
  value = aws_db_instance.rds_instance.id
}

output "rds_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}
