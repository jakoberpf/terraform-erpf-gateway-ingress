module "ingress_module" {
  source = "../../"

  providers = {
    cloudflare = cloudflare
    remote     = remote.gateway1
  }

  domains = [
    "domain.test.erpf.de"
  ]
  host = "localhost"
  port = "2222"

  cloudflare_email   = var.cloudflare_email
  cloudflare_zone_id = var.cloudflare_zone_id
  cloudflare_token   = var.cloudflare_token

  cloudflare_record_value   = "gateway.test.erpf.de" # var.cloudflare_record_value
  cloudflare_record_type    = "CNAME"                # var.cloudflare_record_type
  cloudflare_record_proxied = false                  # var.cloudflare_record_proxied
}
