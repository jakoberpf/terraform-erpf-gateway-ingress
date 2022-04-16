resource "cloudflare_record" "cnames" {
  for_each = toset(var.domains)
  zone_id  = var.cloudflare_zone_id
  name     = each.key
  value    = var.cloudflare_record_value
  type     = var.cloudflare_record_type
  proxied  = var.cloudflare_record_proxied
}
