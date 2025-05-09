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

variable "ssh_key" {
  description = "SSH key"
  type        = string
  default     = "Uni DevOps IK Key"
}

variable "instance_names" {
  default = ["primary", "replica"]
}
