resource "aws_subnet" "public_a" {
  count = length(var.subnet_names)

  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone 
  map_public_ip_on_launch = var.map_public_ip_on_launch
 

  tags = {
    Name = var.subnet_names[count.index]
  }
}