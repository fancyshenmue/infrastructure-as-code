// allow vpn
resource "cloudflare_filter" "allow_vpn" {
  zone_id     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "allow vpn"
  expression  = "(ip.src in {10.0.0.1})"
}

resource "cloudflare_firewall_rule" "allow_vpn" {
  zone_id     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "allow vpn"
  filter_id   = cloudflare_filter.allow_vpn.id
  priority    = "1"
  action      = "allow"
}

// allow specific address
resource "cloudflare_filter" "allow_specific_address" {
  zone_id     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "allow specific address"
  expression  = "(ip.src in {10.0.0.2 10.0.0.3} and http.host in {\"demo.com\" \"www.demo.com\"})"
}

resource "cloudflare_firewall_rule" "allow_specific_address" {
  zone_id     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "allow specific address"
  filter_id   = cloudflare_filter.allow_specific_address.id
  priority    = "81"
  action      = "allow"
}

// allow tw
resource "cloudflare_filter" "allow_tw" {
  zone_id     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "allow tw"
  expression  = "(ip.geoip.country in {\"TW\"} and http.host in {\"demo.com\" \"www.demo.com\"})"
}

resource "cloudflare_firewall_rule" "allow_tw" {
  zone_id     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "allow tw"
  filter_id   = cloudflare_filter.allow_tw.id
  priority    = "91"
  action      = "allow"
}

// block all
resource "cloudflare_filter" "block_all" {
  zone_id     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "block all"
  expression  = "(not ip.src in {10.0.0.1})"
}

resource "cloudflare_firewall_rule" "block_all" {
  zone_id     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "block all"
  filter_id   = cloudflare_filter.block_all.id
  priority    = "100"
  action      = "block"
}
