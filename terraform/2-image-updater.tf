
resource "helm_release" "updater" {
  chart = "argocd-image-updater"
  name  = "updater"

  repository = "https://argoproj.github.io/argo-helm"
  namespace = "argocd"
  create_namespace = true
  version = "0.8.4"
  cleanup_on_fail = true

  values = [file("values/image-updater.yaml")]
}