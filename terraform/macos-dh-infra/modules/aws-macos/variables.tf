
variable "instance_type" {
  description = "Value of the instance type for the EC2 instance"
  type        = string

  validation {
    condition     = startswith(var.instance_type, "mac") && endswith(var.instance_type, ".metal")
    error_message = "The instance type should be a bare metal Mac type."
  }
}

variable "ami_filter" {
  description = "Value of the instance type for the EC2 instance"
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

variable "management_subnet" {
  description = "Allow access from management subnet"
  type        = list(string)
  default     = []
}

variable "number_of_instances" {
  description = "Desired Capacity of EC2 Mac1 instances in ASG"
  type        = number
}