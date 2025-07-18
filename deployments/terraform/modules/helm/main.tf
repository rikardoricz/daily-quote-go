
resource "helm_release" "kube-prometheus" {
  name             = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true
  timeout          = 2000
  wait             = false

  set = [
    {
      name  = "prometheus.prometheusSpec.maximumStartupDurationSeconds"
      value = "300"
    }
  ]
}