variable "vpc_id" {
  description = "VPC Id for LB Target Group"
  type        = string
}

variable "key_name" {
  description = "Value of SSH key name"
  type        = string
}

variable "max_number_of_instances" {
  description = "Desired Capacity of Linux instances in ASG"
  type        = number
}

variable "ami_owner" {
  description = "Value of account owner of the AMI"
  type        = string
}