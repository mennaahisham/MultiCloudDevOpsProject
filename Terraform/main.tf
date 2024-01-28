terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  # Dummy AWS access key and secret key
  # Note: In a real environment, you would obtain these credentials from the AWS IAM console.
  access_key = "dummy-access-key"
  secret_key = "dummy-secret-key"
}

module "ec2" {
  source = "./modules/ec2"

  ec2_instance_type    = "t2.micro"
  ec2_ami = module.ec2.ec2_instance_id
  ec2_subnet_id = module.subnets.subnet_id
}
module "security_groups" {
  source            = "./modules/security_groups"
  vpc_id            = aws_vpc.my_vpc.id
  sg_name           = "my-sg"
  http_ingress_port = 80
  ssh_ingress_port  = 22
}


module "subnets" {
  source = "./modules/subnets"
  subnet_names         = ["subnet-a", "subnet-b", "subnet-c"] 
  vpc_id = module.vpc.vpc_id
  cidr_block          = "10.0.1.0/24"  
  availability_zone   = "us-east-1a"
  map_public_ip_on_launch = true

}

module "vpc" {
  source = ".modules/vpc"

  cidr_block = "10.0.0.0/16"
}