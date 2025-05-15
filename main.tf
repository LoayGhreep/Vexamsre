provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "ec2" {
  source                   = "./modules/ec2"
  vpc_id                   = module.vpc.vpc_id
  subnet_id                = module.vpc.public_subnet_id
  ami_id                   = var.ec2_ami_id
  instance_type            = "t2.micro"
  iam_instance_profile_name = module.s3_iam.instance_profile_name
}


module "rds" {
  source             = "./modules/rds"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = [module.vpc.private_subnet_id]
  ec2_sg_id          = module.ec2.ec2_sg_id
}

module "s3_iam" {
  source      = "./modules/s3_iam"
  bucket_name = "my-app-bucket-${random_id.suffix.hex}" # Optional: make it unique
}

module "lambda_apigw" {
  source = "./modules/lambda_apigw"
}
