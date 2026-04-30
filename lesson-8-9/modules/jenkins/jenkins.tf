resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  namespace  = "jenkins"

  create_namespace = true
  timeout = 900
  wait    = true

  values = [file("${path.module}/values.yaml")]
}