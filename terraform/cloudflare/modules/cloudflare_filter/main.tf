resource "cloudflare_filter" "default" {
  count       = length(var.cloudflare_filter)
  zone_id     = lookup(var.cloudflare_filter[count.index], "zone_id")
  description = lookup(var.cloudflare_filter[count.index], "description")
  expression  = lookup(var.cloudflare_filter[count.index], "expression")
}
