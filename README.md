# The ERPF Ingress - Cloudflare -> Caddy -> Zerotier

[Terraform Registry](https://registry.terraform.io/modules/jakoberpf/gateway-ingress/erpf/latest)

## Usage

```hcl
module "ingress_module" {
  source  = "jakoberpf/gateway-ingress/erpf"

  providers = {
    cloudflare = cloudflare
    remote     = remote
  }

  domains = [
      "application.example.com"
  ]

  host    = "gateway.example.com" or "XXX.XXX.XXX.XXX"
  port    = "8000"

  cloudflare_email   = "<cloudflare_email>"
  cloudflare_zone_id = "<cloudflare_zone_id>"
  cloudflare_token   = "<cloudflare_token>"

  cloudflare_record_value   = "gateway.example.com"
}
```

## Improvements

<https://caddyserver.com/docs/caddyfile/directives/reverse_proxy>

- forward/set SNI

```json
transport http {
  tls
  tls_insecure_skip_verify
  tls_server_name ${domain}
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.12.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_remote"></a> [remote](#provider\_remote) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.cnames](https://registry.terraform.io/providers/cloudflare/cloudflare/4.12.0/docs/resources/record) | resource |
| [random_string.deployment_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [remote_file.this](https://registry.terraform.io/providers/tenstad/remote/latest/docs/resources/file) | resource |
| [template_file.default](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_email"></a> [cloudflare\_email](#input\_cloudflare\_email) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_record_proxied"></a> [cloudflare\_record\_proxied](#input\_cloudflare\_record\_proxied) | n/a | `bool` | `false` | no |
| <a name="input_cloudflare_record_type"></a> [cloudflare\_record\_type](#input\_cloudflare\_record\_type) | The type of dns record to set. Can be of type A, AAAA or CNAME | `string` | `"CNAME"` | no |
| <a name="input_cloudflare_record_value"></a> [cloudflare\_record\_value](#input\_cloudflare\_record\_value) | The value of the dns record, aka. the gateway/loadbalancer public ip | `string` | `"gateway.dns.erpf.de"` | no |
| <a name="input_cloudflare_token"></a> [cloudflare\_token](#input\_cloudflare\_token) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | n/a | `string` | n/a | yes |
| <a name="input_domains"></a> [domains](#input\_domains) | n/a | `list(string)` | `[]` | no |
| <a name="input_host"></a> [host](#input\_host) | n/a | `string` | `""` | no |
| <a name="input_https_enabled"></a> [https\_enabled](#input\_https\_enabled) | n/a | `string` | `"true"` | no |
| <a name="input_port"></a> [port](#input\_port) | n/a | `number` | `0` | no |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | `"default"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->