
# Before be sure to add argocd helm repo
# helm repo add argo https://argoproj.github.io/argo-helm
# helm repo update

resource "helm_release" "argocd" {
  chart = "argo-cd"
  name  = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  namespace = "argocd"
  create_namespace = true
  cleanup_on_fail = true

  values = [file("values/argocd.yaml")]

}