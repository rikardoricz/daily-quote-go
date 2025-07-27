
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

resource "helm_release" "nginx_ingress" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  wait             = true


  set = [
    {
      name  = "controller.service.type"
      value = "LoadBalancer"
    },
    {
      name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-health-probe-request-path"
      value = "/healthz"
    },
    {
      name  = "controller.metrics.enabled"
      value = "true"
    },
    # {
    #   name  = "controller.replicaCount"
    #   value = "2"
    # }
  ]
}

resource "helm_release" "cert-manager" {
  name             = "cert-manager"
  chart            = "cert-manager"
  repository       = "https://charts.jetstack.io"
  version          = "v1.18.2"
  namespace        = "cert-manager"
  create_namespace = true

  set = [
    {
      name  = "prometheus.enabled"
      value = "true"
    },
    {
      name  = "crds.enabled"
      value = "true"
    }
  ]
}