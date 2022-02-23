module "this" {
  source = "../../"

  providers = {
    cloudflare = cloudflare
    remote     = remote
  }

  domains = [
    "test-application.erpf.de"
  ]
  host = "localhost"
  port = "2222"

  ssh_secret_key = file("~/.ssh/id_rsa")

  cloudflare_email   = var.cloudflare_email
  cloudflare_zone_id = var.cloudflare_zone_id
  cloudflare_token   = var.cloudflare_token

  cloudflare_record_value = "test" #var.cloudflare_record_value
  #cloudflare_record_type    = "" #var.cloudflare_record_type
  cloudflare_record_proxied = false #var.cloudflare_record_proxied
}
