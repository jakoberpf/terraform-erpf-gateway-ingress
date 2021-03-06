terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.8.0"
    }
    remote = {
      source  = "tenstad/remote"
    }
  }
}

resource "random_string" "deployment_id" {
  length  = 5
  upper   = false
  lower   = true
  number  = true
  special = false
}
