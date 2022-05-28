output "bucket_arn" {
  value = aws_s3_bucket.site.arn
}

output "ec2_arn" {
  value = aws_instance.appliance.arn
}