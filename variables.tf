variable "domains" {
  type    = list(string)
  default = []
}

# variable "domains" {
#   type = map(object({
#     domain = string
#     host   = string
#     port   = string
#   }))
#   description = ""
# }

variable "type" {
  type    = string
  default = "default"
}

variable "host" {
  type    = string
  default = ""
}

variable "port" {
  type    = number
  default = 0
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

variable "cloudflare_record_value" {
  type        = string
  description = "The value of the dns record, aka. the gateway/loadbalancer public ip"
  default     = "gateway.dns.erpf.de"
}

variable "cloudflare_record_type" {
  type        = string
  description = "The type of dns record to set. Can be of type A, AAAA or CNAME"
  default     = "CNAME"
}

variable "cloudflare_record_proxied" {
  type        = bool
  description = ""
  default     = false
}
