variable "vpc_id" {
  description = "VPC Id for LB Target Group"
  type        = string
}

variable "number_of_instances" {
  description = "Desired Capacity of Linux instances in ASG"
  type        = number
  default     = 0
}