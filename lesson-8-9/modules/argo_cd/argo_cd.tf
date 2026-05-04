resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = var.namespace

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  create_namespace = true

  values = [
    file("${path.module}/values.yaml")
  ]
}

resource "helm_release" "argocd_apps" {
  name      = "argocd-apps"
  namespace = var.namespace

  chart = "${path.module}/charts"

  depends_on = [
    helm_release.argocd
  ]
}