provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
}
terraform {
  backend "s3" {
    bucket = "backend-s3-2tierapps"
    key = "2-tier application/terraform.tfstate"
    region = "us-east-1"
  }
}
module "vpc" {
  source = "./modules/vpc"
}
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}
module "alb" {
  source    = "./modules/alb"
  vpc_id    = module.vpc.vpc_id
  sg        = [module.sg.ec2_secuirty_id]
  subnet    = [module.vpc.pub_subnet_a_id, module.vpc.pub_subnet_b_id]
  target_1a = module.ec2.ec2_1a_id
  target_1b = module.ec2.ec2_1b_id
}
module "ec2" {
  source    = "./modules/ec2"
  subnet_1a = module.vpc.pub_subnet_a_id
  subnet_1b = module.vpc.pub_subnet_b_id
  vpc-sg    = module.sg.ec2_secuirty_id
  key       = module.vpc.key_name
}
module "rds" {
  source = "./modules/rds"
  rds_sg = module.sg.rds_secuirty_id
  subet_rds = [module.vpc.priv_subnet_a_id,module.vpc.priv_subnet_b_id]
}