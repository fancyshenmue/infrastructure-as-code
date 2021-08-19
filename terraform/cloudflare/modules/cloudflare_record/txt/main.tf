resource "cloudflare_record" "record_txt" {
  count = length(var.cloudflare_record_txt)

  zone_id = lookup(var.cloudflare_record_txt[count.index], "zone_id")
  name    = lookup(var.cloudflare_record_txt[count.index], "name")
  value   = lookup(var.cloudflare_record_txt[count.index], "value")
  type    = lookup(var.cloudflare_record_txt[count.index], "type")
  ttl     = lookup(var.cloudflare_record_txt[count.index], "ttl")
  proxied = lookup(var.cloudflare_record_txt[count.index], "proxied")
}
