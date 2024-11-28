variable "location" {
  description = "location name for region"
  type = string
}

variable "ami" {
  description = "ami details"
  type = string
}

variable "instance_type" {
  description = "instance type details"
  type = string
}

variable "tag" {
  description = "tag for ec2"
}