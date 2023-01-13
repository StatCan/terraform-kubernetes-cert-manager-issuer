variable "name" {
  type        = string
  description = "the name of the issuer release and by default the resulting ClusterIssuer name"
}

variable "namespace" {
  type        = string
  description = "The namespace where the resources should be deployed."
}

variable "acme_email" {
  type        = string
  description = "the email associated with the ACME issuer account. this will be used as a primary point of contact for certificate expiry and issues related to the ACME account"
}

variable "acme_server" {
  type        = string
  description = "a url pointing to a ACME server to use for certificate generation/signing. Provided host MUST adhere to the ACME spec"
  default     = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

variable "acme_dns01_azuredns_subscription_id" {
  type        = string
  description = "the azure subscription ID where azureDNS is located. required for DNS challenge solver"
}

variable "acme_dns01_azuredns_resource_group_name" {
  type        = string
  description = "the azure resource group which contains azureDNS"
}

variable "acme_dns01_azuredns_hosted_zone_name" {
  type        = string
  description = "the DNS zone to use for azureDNS solver"
}

variable "acme_http01_ingress_class" {
  type        = string
  description = "the name of the ingress class to use in association with the generated ClusterIssuer. Challenge solver configurations can be configured for the ingress controller"
}

variable "acme_http01_ingress_service_type" {
  default     = "NodePort"
  type        = string
  description = "Defines what type of Service should be created."
  validation {
    condition     = contains(["NodePort", "LoadBalancer", "ClusterIP"], var.acme_http01_ingress_service_type)
    error_message = "The acme_http01_ingress_service_type must be one of NodePort, LoadBalancer, or ClusterIP."
  }
}
