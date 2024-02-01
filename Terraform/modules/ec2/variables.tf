variable "ec2_subnet_id" {
  description = "ID of the subnet where EC2 instances will be launched"
  type        = string
}

variable "ec2_instance_type" {
  description = "AWS EC2 instance type."
  default = "t2.micro"
  type        = string
}

variable "ec2_ami" {
  description = "ami id"
  type = string
}
