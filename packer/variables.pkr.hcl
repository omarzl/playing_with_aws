
variable "ami_identifier" {
  type = string
}

variable "intance_type" {
  type = string
}

variable "base_ami_name" {
  type = string
}

variable "script_path" {
  type = string
}

variable "FASTLANE_SESSION" {
  type = string
  sensitive = true
}