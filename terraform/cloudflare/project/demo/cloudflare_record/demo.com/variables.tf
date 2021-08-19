variable "cloudflare_record_a" {
  type = list(object({
    zone_id = string
    name    = string
    value   = string
    type    = string
    ttl     = number
    proxied = bool
  }))
  default = [
    {
      zone_id = ""
      name    = ""
      value   = ""
      type    = ""
      ttl     = 3600
      proxied = true
    }
  ]
  description = "Cloudflare Record A"
}

variable "cloudflare_record_cname" {
  type = list(object({
    zone_id = string
    name    = string
    value   = string
    type    = string
    ttl     = number
    proxied = bool
  }))
  default = [
    {
      zone_id = ""
      name    = ""
      value   = ""
      type    = ""
      ttl     = 3600
      proxied = true
    }
  ]
  description = "Cloudflare Record CNAME"
}

variable "cloudflare_record_txt" {
  type = list(object({
    zone_id = string
    name    = string
    value   = string
    type    = string
    ttl     = number
    proxied = bool
  }))
  default = [
    {
      zone_id = ""
      name    = ""
      value   = ""
      type    = ""
      ttl     = 3600
      proxied = false
    }
  ]
  description = "Cloudflare Record TXT"
}

variable "cloudflare_record_mx" {
  type = list(object({
    zone_id  = string
    name     = string
    value    = string
    type     = string
    ttl      = number
    proxied  = bool
    priority = number
  }))
  default = [
    {
      zone_id  = ""
      name     = ""
      value    = ""
      type     = ""
      ttl      = 3600
      proxied  = false
      priority = 10
    }
  ]
  description = "Cloudflare Record MX"
}

variable "cloudflare_record_ns" {
  type = list(object({
    zone_id = string
    name    = string
    value   = string
    type    = string
    ttl     = number
    proxied = bool
  }))
  default = [
    {
      zone_id = ""
      name    = ""
      value   = ""
      type    = ""
      ttl     = 3600
      proxied = false
    }
  ]
  description = "Cloudflare Record NS"
}
