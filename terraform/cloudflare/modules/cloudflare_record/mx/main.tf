resource "cloudflare_record" "record_mx" {
  count = length(var.cloudflare_record_mx)

  zone_id  = lookup(var.cloudflare_record_mx[count.index], "zone_id")
  name     = lookup(var.cloudflare_record_mx[count.index], "name")
  value    = lookup(var.cloudflare_record_mx[count.index], "value")
  type     = lookup(var.cloudflare_record_mx[count.index], "type")
  ttl      = lookup(var.cloudflare_record_mx[count.index], "ttl")
  proxied  = lookup(var.cloudflare_record_mx[count.index], "proxied")
  priority = lookup(var.cloudflare_record_mx[count.index], "priority")
}
