# The ERPF Ingress - Cloudflare -> Caddy -> Zerotier

## Usage

```hcl
module "glacier_cluster_ingress" {
  source = "./../../terraform/modules/erpf/cloudflare-caddy-ingress"
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
