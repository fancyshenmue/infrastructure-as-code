variable "cloudflare_argo" {
  type = list(object({
    zone_id        = string
    tiered_caching = string
    smart_routing  = string
  }))
  default = [
    {
      zone_id        = ""
      tiered_caching = "on"
      smart_routing  = "on"
    }
  ]
  description = "Cloudflare Argo"
}
