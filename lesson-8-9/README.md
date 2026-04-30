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