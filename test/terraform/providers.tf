terraform {
  required_version = ">= 1.0.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.35.0"
    }
    remote = {
      source  = "tenstad/remote"
      version = "0.0.23"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "remote" {
  alias = "gateway1"
  conn {
    host        = "localhost"
    port        = 2222
    user        = "test-user"
    private_key = file("../docker/id_rsa")
    sudo        = true
  }
}
