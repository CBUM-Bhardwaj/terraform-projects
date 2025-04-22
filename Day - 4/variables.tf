variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
  type        = string
}

variable "ec2_root_storage_size" {
  description = "Root volume size in GB"
  default     = 8
  type        = number
}

variable "ec2_ami_id" {
  description = "Ubuntu AMI ID"
  default     = "ami-084568db4383264d4"
  type        = string
}
