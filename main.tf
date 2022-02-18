terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.8.0"
    }
    remote = {
      source  = "tenstad/remote"
      version = "0.0.23"
    }
  }
}

provider "remote" {
  max_sessions = 2

  conn {
    user        = "ubuntu"
    private_key = var.ssh_secret_key
    host        = "0.gateway.dns.erpf.de"
    sudo        = true
  }
}

# locals {
#   domain_map = flatten([
#     for key, value in var.sql_instances : [
#       for item in value.db_list : {
#         name     = item
#         instance = key
#       }
#     ]
#   ])
#   sql_databases = {
#     for item in local.databases :
#     uuid() => item
#   }
# }

resource "random_string" "deployment_id" {
  length  = 5
  upper   = false
  lower   = true
  number  = true
  special = false
}
