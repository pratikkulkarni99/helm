provider "helm" {
  kubernetes {
    host                   = data.google_container_cluster.gke.endpoint
    cluster_ca_certificate = base64decode(data.google_container_cluster.gke.master_auth[0].cluster_ca_certificate)
  exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["gke", "get-token", "--cluster-name", data.google_container_cluster.cluster.name]
      command     = "google"
    }
}
}
resource "helm_release" "kubewatch" {
  name       = "kubewatch"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kubewatch"

  values = [
    file("${path.module}/kubewatch-values.yaml")
  ]

  set_sensitive {
    name  = "slack.token"
    value = var.slack_app_token
  }
}
