data "template_file" "this" {
  count    = length(var.domains)
  template = file("${path.module}/templates/caddy.tftpl")

  vars = {
    domain           = var.domains[count.index]
    host             = var.host
    port             = var.port
    cloudflare_email = var.cloudflare_email
    cloudflare_token = var.cloudflare_token
    log_file_path    = "/var/log/caddy/access-${replace(var.domains[count.index], ".", "-")}.log"
  }
}

resource "remote_file" "this" {
  count       = length(var.domains)
  path        = "/home/ubuntu/caddy/${replace(var.domains[count.index], ".", "-")}.caddy"
  content     = data.template_file.this[count.index].rendered
  permissions = "0644"
}
