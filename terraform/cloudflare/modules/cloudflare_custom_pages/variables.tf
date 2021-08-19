variable "cloudflare_custom_pages" {
  type = list(object({
    account_id = string
    zone_id = string
    type = string
    url = string
    state = string
  }))
  default = [
    {
      account_id = ""
      zone_id = ""
      type = ""
      url = ""
      state = ""
    }
  ]
  description = "Cloudflare Custom Pages"
}
