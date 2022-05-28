output "bucket_arn" {
  value = aws_s3_bucket.site.arn
}

output "ec2_arn" {
  value = aws_instance.appliance.arn
}

output "instance_id" {
  value = aws_instance.appliance.id
}

output "instance_public_ip" {
  value = aws_instance.appliance.public_ip
}