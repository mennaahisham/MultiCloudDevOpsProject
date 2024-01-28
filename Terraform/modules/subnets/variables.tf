variable "vpc_id" {
  description = "ID of the VPC where the subnet will be created."
  default = aws_vpc.my_vpc.id
  type        = string
}
variable "cidr_block" {
  description = "CIDR block for the subnet."
  default = "10.0.1.0/24"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet."
  default = "us-east-1a"
  type        = string
}

variable "subnet_names" {
  description = "Names of the subnets"
  type        = list(string)
}
variable "map_public_ip_on_launch" {
  description = "Whether instances launched into these subnets should receive public IPs"
  type        = bool
  default     = false
}