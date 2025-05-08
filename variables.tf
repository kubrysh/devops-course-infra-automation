variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-03250b0e01c28d196"  # Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_key_1" {
  description = "First SSH key"
  type        = string
  default     = "Uni DevOps IK Key"
}

variable "ssh_key_2_pub" {
  description = "Second SSH key: Public Key"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOkAhvfRyUvgsUwENIds1a/4OvuHQgLki8K1EzPltl5M i.ilin@iilin-pro14.local"
}
