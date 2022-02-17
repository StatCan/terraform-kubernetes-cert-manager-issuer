variable "name" {

}

variable "namespace" {
  description = "The namespace where the resources should be deployed."
}

variable "acme_email" {

}

variable "acme_server" {
  default = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

variable "acme_dns01_azuredns_subscription_id" {

}

variable "acme_dns01_azuredns_resource_group_name" {

}

variable "acme_dns01_azuredns_hosted_zone_name" {

}

variable "acme_http01_ingress_class" {

}

variable "acme_http01_ingress_service_type" {
  default = "NodePort"
  type = string
  description = "Defines what type of Service should be created."
  validation {
    condition = contains(["NodePort", "LoadBalancer", "ClusterIP"], var.acme_http01_ingress_service_type)
    error_message = "The acme_http01_ingress_service_type must be one of NodePort, LoadBalancer, or ClusterIP."
  }
}
