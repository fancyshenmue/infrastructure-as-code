resource "cloudflare_record" "record_a" {
  count = length(var.cloudflare_record_a)

  zone_id = lookup(var.cloudflare_record_a[count.index], "zone_id")
  name    = lookup(var.cloudflare_record_a[count.index], "name")
  value   = lookup(var.cloudflare_record_a[count.index], "value")
  type    = lookup(var.cloudflare_record_a[count.index], "type")
  ttl     = lookup(var.cloudflare_record_a[count.index], "ttl")
  proxied = lookup(var.cloudflare_record_a[count.index], "proxied")
}
