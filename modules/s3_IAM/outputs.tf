output "bucket_name" {
  value = aws_s3_bucket.app_bucket.id
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}
