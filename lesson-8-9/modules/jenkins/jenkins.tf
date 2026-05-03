resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  namespace  = "jenkins"

  create_namespace = true
  timeout          = 900
  wait             = true

  values = [file("${path.module}/values.yaml")]

  set_sensitive = [
    {
      name  = "controller.admin.password"
      value = var.jenkins_admin_password
    }
  ]
}