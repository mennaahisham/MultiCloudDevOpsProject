variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "my-sg"
}

variable "http_ingress_port" {
  description = "Port for allowing HTTP traffic"
  type        = number
  default     = 80
}

variable "ssh_ingress_port" {
  description = "Port for allowing SSH traffic"
  type        = number
  default     = 22
}
