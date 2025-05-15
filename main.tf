provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "ec2" {
  source     = "./modules/ec2"
  vpc_id     = module.vpc.vpc_id
  subnet_id  = module.vpc.public_subnet_id
  ami_id     = var.ec2_ami_id
  instance_type = "t2.micro"
}
