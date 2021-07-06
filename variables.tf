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
