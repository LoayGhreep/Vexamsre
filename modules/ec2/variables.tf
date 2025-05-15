variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ami_id" {
  type        = string
  description = "AMI to use for EC2 instance (mocked for validate)"
  default     = "ami-12345678" # ⚠️ placeholder, won't work for apply
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}
