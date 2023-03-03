resource "helm_release" "issuer" {
  chart     = "${path.module}/issuer"
  name      = "issuer-${var.name}"
  namespace = var.namespace

  set {
    name  = "email"
    value = var.acme_email
  }

  set {
    name  = "server"
    value = var.acme_server
  }

  values = [<<EOF
solvers:
  - dns01:
      cnameStrategy: Follow
      azureDNS:
        subscriptionID: "${var.acme_dns01_azuredns_subscription_id}"
        resourceGroupName: "${var.acme_dns01_azuredns_resource_group_name}"
        hostedZoneName: "${var.acme_dns01_azuredns_hosted_zone_name}"
    selector:
      matchLabels:
        use-azuredns-solver: 'true'
  - http01:
      ingress:
        class: "${var.acme_http01_ingress_class}"
        serviceType: "${var.acme_http01_ingress_service_type}"
    selector:
      matchLabels:
        use-http-solver: 'true'
EOF
  ]
}
