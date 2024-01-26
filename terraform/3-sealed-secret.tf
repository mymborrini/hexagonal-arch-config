resource "helm_release" "sealed_secrets" {
  chart = "sealed-secrets"
  name  = "sealed-secrets"

  repository = "https://charts.bitnami.com/bitnami"
  namespace = "kube-system"
  create_namespace = true
  version = "1.2.11"
}