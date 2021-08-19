resource "cloudflare_record" "record_cname" {
  count = length(var.cloudflare_record_cname)

  zone_id = lookup(var.cloudflare_record_cname[count.index], "zone_id")
  name    = lookup(var.cloudflare_record_cname[count.index], "name")
  value   = lookup(var.cloudflare_record_cname[count.index], "value")
  type    = lookup(var.cloudflare_record_cname[count.index], "type")
  ttl     = lookup(var.cloudflare_record_cname[count.index], "ttl")
  proxied = lookup(var.cloudflare_record_cname[count.index], "proxied")
}
