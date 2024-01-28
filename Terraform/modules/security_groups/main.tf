resource "aws_security_group" "my_sg" {
  name        = "my-sg"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow http from everywhere"
    from_port        = var.http_ingress_port
    to_port          = var.http_ingress_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow SSH from everywhere"
    from_port        = var.ssh_ingress_port
    to_port          = var.ssh_ingress_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow outgoing traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}