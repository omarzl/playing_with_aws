
variable "instance_type" {
  description = "Value of the instance type for the EC2 instance"
  type        = string
}

variable "ami_filter" {
  description = "Value of the instance type for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Value of SSH key name"
  type        = string
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "VPC Id for LB Target Group"
  type        = string
}

variable "max_number_of_instances" {
  description = "Desired Capacity of instances in ASG"
  type        = number
}