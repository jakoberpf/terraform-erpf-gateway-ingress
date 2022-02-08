variable "domains" {
  type    = list(string)
  default = []
}

variable "host" {
  type    = string
  default = ""
}

variable "port" {
  type    = number
  default = 0
}

# variable "proxies" {
#   type = map(object({
#     domain = string
#     host   = string
#     port   = string
#   }))
#   description = ""
# }

variable "ssh_secret_key" {
  type = string
}

variable "cloudflare_email" {
  type        = string
  description = ""
}

variable "cloudflare_zone_id" {
  type        = string
  description = ""
}

variable "cloudflare_token" {
  type        = string
  description = ""
}
