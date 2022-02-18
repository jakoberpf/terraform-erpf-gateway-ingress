# The ERPF Ingress - Cloudflare -> Caddy -> Zerotier

[Terraform Registry](https://registry.terraform.io/modules/jakoberpf/gateway-ingress/erpf/latest)

## Usage

```hcl
module "gateway_ingress" {
  source  = "jakoberpf/gateway-ingress/erpf"
  version = "0.0.1"

  providers = {
    cloudflare = cloudflare
  }

  domains = [
      "application.example.com"
  ]
  host    = "gateway.example.com" or "XXX.XXX.XXX.XXX"
  port    = "8000"

  ssh_secret_key     = file("~/.ssh/id_rsa")
  cloudflare_email   = "<cloudflare_email>"
  cloudflare_zone_id = "<cloudflare_zone_id>"
  cloudflare_token   = "<cloudflare_token>"
}
```

## Ressources

<https://jhooq.com/terraform-for-and-for-each-loop/>
