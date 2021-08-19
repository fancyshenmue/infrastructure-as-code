variable "zone_setting" {
  type = list(object({
    zone_id        = string
    ssl            = string
    security_level = string
  }))
  default = [
    {
      zone_id        = ""
      ssl            = "flexible"
      security_level = "medium"
    }
  ]
  description = "Cloudflare Zone Setting"
}
