resource "cloudflare_custom_pages" "account_custom_1000x" {
  account_id  = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  zone_id     = null
  type        = "1000_errors"
  url         = "https://demo.com/1000x.html"
  state       = "customized"
}

resource "cloudflare_custom_pages" "account_custom_ip_block" {
  account_id  = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  type        = "ip_block"
  zone_id     = null
  url         = "https://demo.com/index.html"
  state       = "customized"
}
