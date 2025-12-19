variable "region" {
  description = "AWS Region"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu 22.04 in Mumbai"
  # This is the standard Ubuntu 22.04 AMI for ap-south-1
  default     = "ami-00bb6a80f01f03502" 
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}