data "template_file" "default" {
  count    = length(var.domains)
  template = file("${path.module}/templates/caddy.${var.type}.tpl")

  vars = {
    domain           = var.domains[count.index]
    host             = var.host
    port             = var.port
    log_file_path    = "/var/log/caddy/access-${replace(var.domains[count.index], ".", "-")}.log"
  }
}

resource "remote_file" "this" {
  count       = length(var.domains)
  path        = "/home/ubuntu/caddy/${replace(var.domains[count.index], ".", "-")}.caddy"
  content     = data.template_file.default[count.index].rendered
  permissions = "0644"
}
