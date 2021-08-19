variable "cloudflare_filter" {
  type = list(object({
    zone_id = string
    description = string
    expression = string
  }))
  default = [
    {
      zone_id = ""
      description = ""
      expression = ""
    }
  ]
  description = "Cloudflare Filter"
}
