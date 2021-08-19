resource "cloudflare_zone_settings_override" "default" {
  count   = length(var.zone_setting)
  zone_id = lookup(var.zone_setting[count.index], "zone_id")
  settings {
    ssl                      = lookup(var.zone_setting[count.index], "ssl")
    brotli                   = "on"
    challenge_ttl            = 2700
    security_level           = lookup(var.zone_setting[count.index], "security_level")
    opportunistic_encryption = "on"
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    mirage                   = "on"
    waf                      = "on"
    minify {
      css  = "on"
      js   = "on"
      html = "on"
    }
    security_header {
      enabled = true
    }
  }
}
