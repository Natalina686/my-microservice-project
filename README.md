# DevOps Microservice Project

## Overview

AWS-based microservice project with full CI/CD and monitoring:

* Terraform (VPC, EKS, RDS, ECR)
* Jenkins (CI)
* Argo CD (CD)
* Prometheus + Grafana (Monitoring)

## Run Infrastructure

terraform init
terraform apply

## Verify

kubectl get all -n jenkins
kubectl get all -n argocd
kubectl get all -n monitoring
kubectl get applications -n argocd


Expected:

* django-app → Synced
* monitoring → Synced


## Access Services

### Jenkins

kubectl port-forward svc/jenkins 8080:8080 -n jenkins

### Argo CD

kubectl port-forward svc/argocd-server 8081:443 -n argocd


### Grafana

kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring


Open: [http://localhost:3000](http://localhost:3000)


## Monitoring

Deployed via Argo CD (kube-prometheus-stack):

* Prometheus
* Grafana

Dashboards:

* Kubernetes cluster
* CPU / Memory usage

## Cleanup

terraform destroy
