resource "cloudflare_custom_pages" "default" {
  count      = length(var.cloudflare_custom_pages)
  account_id = lookup(var.cloudflare_custom_pages[count.index], "zone_id")
  zone_id    = lookup(var.cloudflare_custom_pages[count.index], "zone_id")
  type       = lookup(var.cloudflare_custom_pages[count.index], "type")
  url        = lookup(var.cloudflare_custom_pages[count.index], "url")
  state      = lookup(var.cloudflare_custom_pages[count.index], "state")
}
