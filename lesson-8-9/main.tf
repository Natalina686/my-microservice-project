module "s3_backend" {
  source      = "./modules/s3-backend"
  bucket_name = "nata-lesson8-tfstate-683966916235"
  table_name  = "terraform-locks"
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets    = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  vpc_name           = "lesson-8-vpc"
}

module "ecr" {
  source       = "./modules/ecr"
  ecr_name     = "django-app"
  scan_on_push = true
}

module "eks" {
  source = "./modules/eks"

  cluster_name = "lesson-8-cluster"
  subnet_ids   = module.vpc.private_subnets
  vpc_id       = module.vpc.vpc_id

  depends_on = [module.vpc]
}

module "jenkins" {
  source    = "./modules/jenkins"
  namespace = "jenkins"
  jenkins_admin_password = var.jenkins_admin_password
  depends_on = [module.eks]
  
}

module "argo_cd" {
  source    = "./modules/argo_cd"
  namespace = "argocd"

  depends_on = [module.eks]
}

module "rds" {
  source = "./modules/rds"

  use_aurora = false

  db_name  = "appdb"
  username  = "postgres"
  db_password = var.db_password

  engine         = "postgres"
  engine_version = "15"
  instance_class = "db.t3.micro"
  multi_az       = false

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id
}

module "monitoring" {
  source = "./modules/monitoring"
  depends_on = [module.eks]
}