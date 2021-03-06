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
