cloudflare_record_a = [
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "@"
    value = "10.1.0.1"
    type = "A"
    ttl = 1
    proxied = true
  },
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "www"
    value = "10.1.0.1"
    type = "A"
    ttl = 1
    proxied = true
  },
]

cloudflare_record_cname = [
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "www"
    value = "demo2.com"
    type = "CNAME"
    ttl = 1
    proxied = true
  },
]

cloudflare_record_mx = [
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "demo2.com"
    value = "alt4.aspmx.l.google.com"
    type = "MX"
    ttl = 1
    priority = 10
    proxied = false
  },
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "demo2.com"
    value = "alt3.aspmx.l.google.com"
    type = "MX"
    ttl = 1
    priority = 10
    proxied = false
  },
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "demo2.com"
    value = "alt2.aspmx.l.google.com"
    type = "MX"
    ttl = 1
    priority = 5
    proxied = false
  },
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "demo2.com"
    value = "alt1.aspmx.l.google.com"
    type = "MX"
    ttl = 1
    priority = 5
    proxied = false
  },
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "demo2.com"
    value = "aspmx.l.google.com"
    type = "MX"
    ttl = 1
    priority = 1
    proxied = false
  },
]

cloudflare_record_txt = [
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "dc-xxxxxxxxxx._spfm"
    value = "v=spf1 include:_spf.google.com ~all"
    type = "TXT"
    ttl = 1
    proxied = false
  },
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "demo2.com"
    value = "google-site-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    type = "TXT"
    ttl = 1
    proxied = false
  },
  {
    zone_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    name = "demo2.com"
    value = "v=spf1 include:dc-xxxxxxxxxx._spfm.demo2.com ~all"
    type = "TXT"
    ttl = 1
    proxied = false
  },
]

cloudflare_record_ns = []
