
variable "instance_type" {
  description = "Value of the instance type for the EC2 instance"
  type        = string
}

variable "ami_filter" {
  description = "Value of the instance type for the EC2 instance"
  type        = string
}

variable "ami_owner" {
  description = "Value of account owner of the AMI"
  type        = string
  default     = "amazon"
}

variable "key_name" {
  description = "Value of SSH key name"
  type        = string
}

variable "prefix" {
  description = "Prefix for all resource names"
  type        = string
}

variable "vpc_id" {
  description = "VPC Id for LB Target Group"
  type        = string
}

variable "subnet_id" {
  description = "The subnet id to be used"
  type        = string
  default     = null
}

variable "availability_zones" {
  description = "The availability zones to be used"
  type        = list(string)
  default     = ["us-east-1a"]
}

variable "max_number_of_instances" {
  description = "Desired Capacity of instances in ASG"
  type        = number
}

variable "dedicated_hosts" {
  description = "Determines if the infra should use Dedicated Hosts"
  type = object({
    should_use  = bool
    host_family = string
  })
  default = {
    should_use  = false
    host_family = ""
  }
}

variable "user_data" {
  description = "User data base 64 string"
  type        = string
  default     = null
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {}
}

variable "associate_public_ip_address" {
  description = "If should associate public ip addresses"
  type        = bool
  default     = null
}