data "template_file" "default" {
  count    = length(var.domains)
  template = file("${path.module}/templates/caddy.${var.type}.tpl")

  vars = {
    domain           = var.domains[count.index]
    host             = var.host
    port             = var.port
    https            = var.https_enabled
    log_file_path    = "/var/log/caddy/access-${replace(var.domains[count.index], ".", "-")}.log"
  }
}

resource "remote_file" "this" {
  # https://gist.github.com/pio2pio/e27f66ff4ed15221cd11519c71953501
  count       = length(var.domains)
  path        = "/home/ubuntu/caddy/${replace(var.domains[count.index], ".", "-")}.caddy"
  content     = data.template_file.default[count.index].rendered
  permissions = "0644"
}
