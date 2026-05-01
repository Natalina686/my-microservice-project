# Lesson 5

## Structure
- s3-backend: S3 + DynamoDB for Terraform state
- vpc: VPC with public/private subnets, NAT, routing
- ecr: Docker registry

## Commands
terraform init
terraform plan
terraform apply
terraform destroy

## Notes
- S3 bucket must be globally unique
- First run may require creating backend resources before enabling backend

# Lesson 7 — Kubernetes on AWS (EKS + Terraform + Helm)


Deployment of a Django application on AWS using:

Terraform (infrastructure provisioning)
Amazon EKS (Kubernetes cluster)
Amazon ECR (Docker registry)
Helm (Kubernetes deployment management)
ConfigMap (environment variables management)
HPA (autoscaling)

Architecture

VPC created via Terraform
EKS cluster deployed in the same VPC
Django application containerized with Docker
Image stored in Amazon ECR
Application deployed via Helm chart
LoadBalancer Service exposes application externally
HPA scales pods based on CPU usage


# Lesson 8-9

# Terraform
terraform init
terraform apply
# Jenkins
відкрити LoadBalancer URL
створити pipeline
запустити build
# Argo CD
kubectl port-forward svc/argo-cd-server -n argocd 8080:443

# Login → перевірити:

Application = Synced
Pods = Running

# Lesson 10 — RDS Module (Terraform)

## Description

Універсальний Terraform модуль для створення:

* Amazon RDS instance
* або Amazon Aurora Cluster

Тип БД визначається через змінну:

use_aurora = true | false

## Usage

module "rds" {
  source = "./modules/rds"

  use_aurora = false

  db_name  = "appdb"
  username = "postgres"
  password = "password"

  engine          = "postgres"
  engine_version  = "15"
  instance_class  = "db.t3.micro"
  multi_az        = false

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id
}

## What the module creates

У будь-якому режимі:

* DB Subnet Group
* Security Group
* Parameter Group

Додатково:

* `use_aurora = false` → aws_db_instance
* `use_aurora = true` → aws_rds_cluster + writer instance


## Variables

| Name           | Description               | Type         | Default     |
| -------------- | ------------------------- | ------------ | ----------- |
| use_aurora     | Enable Aurora cluster     | bool         | false       |
| db_name        | Database name             | string       | appdb       |
| username       | Master username           | string       | —           |
| password       | Master password           | string       | —           |
| engine         | Database engine           | string       | postgres    |
| engine_version | Engine version            | string       | 15          |
| instance_class | Instance type             | string       | db.t3.micro |
| multi_az       | Enable Multi-AZ           | bool         | false       |
| subnet_ids     | Subnets for DB deployment | list(string) | —           |
| vpc_id         | VPC ID                    | string       | —           |


## How to switch DB type

### Aurora

use_aurora = true


### Classic RDS

use_aurora = false

## Change database configuration

### Change instance class


instance_class = "db.t3.small"


### Change engine version


engine_version = "14"


### Enable Multi-AZ

multi_az = true

## Outputs

| Name        | Description       |
| ----------- | ----------------- |
| db_endpoint | Database endpoint |
| db_sg_id    | Security Group ID |


## Commands

terraform init
terraform validate
terraform plan
terraform apply


