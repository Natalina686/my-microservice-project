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