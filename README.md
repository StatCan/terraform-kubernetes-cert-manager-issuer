# Terraform Kubernetes Cert Manager Issuer

## Introduction

A terraform module for deploying a `Issuer` or `ClusterIssuer` CR based on the `clusterissuers.cert-manager.io` or `issuers.cert-manager.io` CRDs to a Kubernetes cluster

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_dns01_azuredns_hosted_zone_name"></a> [acme\_dns01\_azuredns\_hosted\_zone\_name](#input\_acme\_dns01\_azuredns\_hosted\_zone\_name) | the DNS zone to use for azureDNS solver | `string` | n/a | yes |
| <a name="input_acme_dns01_azuredns_resource_group_name"></a> [acme\_dns01\_azuredns\_resource\_group\_name](#input\_acme\_dns01\_azuredns\_resource\_group\_name) | the azure resource group which contains azureDNS | `string` | n/a | yes |
| <a name="input_acme_dns01_azuredns_subscription_id"></a> [acme\_dns01\_azuredns\_subscription\_id](#input\_acme\_dns01\_azuredns\_subscription\_id) | the azure subscription ID where azureDNS is located. required for DNS challenge solver | `string` | n/a | yes |
| <a name="input_acme_email"></a> [acme\_email](#input\_acme\_email) | the email associated with the ACME issuer account. this will be used as a primary point of contact for certificate expiry and issues related to the ACME account | `string` | n/a | yes |
| <a name="input_acme_http01_ingress_class"></a> [acme\_http01\_ingress\_class](#input\_acme\_http01\_ingress\_class) | the name of the ingress class to use in association with the generated ClusterIssuer. Challenge solver configurations can be configured for the ingress controller | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | the name of the issuer release and by default the resulting ClusterIssuer name | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace where the resources should be deployed. | `string` | n/a | yes |
| <a name="input_acme_http01_ingress_service_type"></a> [acme\_http01\_ingress\_service\_type](#input\_acme\_http01\_ingress\_service\_type) | Defines what type of Service should be created. | `string` | `"NodePort"` | no |
| <a name="input_acme_server"></a> [acme\_server](#input\_acme\_server) | a url pointing to a ACME server to use for certificate generation/signing. Provided host MUST adhere to the ACME spec | `string` | `"https://acme-staging-v02.api.letsencrypt.org/directory"` | no |

## Usage

```terraform
module "helm_cert_manager_issuer" {
  source = "git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/terraform/modules/terraform-kubernetes-cert-manager-issuer.git?ref=v1.2.0"

  name      = "cert-manager-issuer"
  namespace = "cert-manager-system"

  acme_dns01_azuredns_hosted_zone_name    = var.acme_dns01_azuredns_hosted_zone_name
  acme_dns01_azuredns_resource_group_name = var.acme_dns01_azuredns_resource_group_name
  acme_dns01_azuredns_subscription_id     = var.acme_dns01_azuredns_subscription_id

  acme_email                = var.acme_email
  acme_http01_ingress_class = var.acme_http01_ingress_class
}

```

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The namespace the identity resides. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->