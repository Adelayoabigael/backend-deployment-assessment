variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources into"
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance sizing"
  default     = "t3.micro"
}

variable "my_ip" {
  type        = string
  description = "Your current public IP address with subnet mask (e.g., 192.168.1.1/32)"
}