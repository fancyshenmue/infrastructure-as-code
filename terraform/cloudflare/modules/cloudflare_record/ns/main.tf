resource "cloudflare_record" "record_ns" {
  count = length(var.cloudflare_record_ns)

  zone_id = lookup(var.cloudflare_record_ns[count.index], "zone_id")
  name    = lookup(var.cloudflare_record_ns[count.index], "name")
  value   = lookup(var.cloudflare_record_ns[count.index], "value")
  type    = lookup(var.cloudflare_record_ns[count.index], "type")
  ttl     = lookup(var.cloudflare_record_ns[count.index], "ttl")
  proxied = lookup(var.cloudflare_record_ns[count.index], "proxied")
}
