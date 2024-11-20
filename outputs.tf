# Output for GitHub repository
output "repository_url" {
  value       = github_repository.example_public_repo.html_url
  description = "The URL of the public GitHub repository created"
}

# Output for S3 bucket name
output "s3_bucket_name" {
  value       = aws_s3_bucket.my_bucket.bucket
  description = "The name of the S3 bucket created"
}
