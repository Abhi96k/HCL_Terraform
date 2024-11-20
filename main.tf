resource "aws_instance" "my_ec2" {
  ami           = "ami-0dee22c13ea7a9a67" # Replace with the latest AMI ID if needed
  instance_type = "t2.micro"

  tags = {
    Name = "my-ec2-instance"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket        = "my-unique-bucket-${random_string.bucket_suffix.result}" 
  force_destroy = true

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}


resource "github_repository" "example_public_repo" {
  name        = "example-public-repo"
  description = "A public GitHub repository managed by Terraform"
  visibility  = "public"
  has_issues  = true
  has_wiki    = true
  allow_merge_commit = true
  allow_squash_merge = true
  allow_rebase_merge = true

  topics = ["terraform", "github", "example"]
}
