variable "github_token" {
  type        = string
  description = "GitHub personal access token with appropriate permissions"
}

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region to deploy resources"
}
