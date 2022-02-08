
resource "cloudflare_record" "cnames" {
  for_each = toset(var.domains)
  zone_id  = var.cloudflare_zone_id
  name     = each.key
  value    = "0.gateway.dns.erpf.de"
  type     = "CNAME"
  proxied  = true
}

# api.backup.k8s.infra.erpf.de backup.k8s.infra.erpf.de {
#     reverse_proxy 10.147.19.110:6443
#     header_up X-Forwarded-Proto https
#     transport http {
#         tls
#         tls_insecure_skip_verify
#     }
# }
