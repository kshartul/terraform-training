#####################################    Virtual Network Creation    #################################################
######################################################################################################################

module "vpc" {
  source                               = "./modules/aws_vpc"
  aws_cidrs                            = "10.211.0.0/16"
  aws_vpc_name                         = "demo-vpc"
}

module "internet_gw" {
  source                               = "./modules/aws_internet_gw"
  aws_vpc_id                           = module.vpc.vpc_id
  aws_internet_gw_name                 = "demo-ig"
}


module "route_tables_public" {
  source                               = "./modules/aws_route_tables_public"
  aws_vpc_id                           = module.vpc.vpc_id
  aws_internet_gw_id                   = module.internet_gw.internet_gw_id
  aws_public_rt_name                   = "demo-public-route"
}


module "mgmt-subnet" {
  source                               = "./modules/aws_subnet_public"
  aws_vpc_id                           = module.vpc.vpc_id
  aws_public_rt_id                     = module.route_tables_public.public_rt_id
  subnet_name                          = "demo-mgmt-subnet"
  aws_cidrs_public                     = var.aws_cidrs_mgmt
  aws_public_azs                       = var.aws_public_azs
}
