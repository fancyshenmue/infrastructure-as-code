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

cloudflare_record_cname = []

cloudflare_record_mx = []

cloudflare_record_txt = []

cloudflare_record_ns = []
