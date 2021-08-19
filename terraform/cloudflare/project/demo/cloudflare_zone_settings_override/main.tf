module "cloudflare_zone_settings_override" {
  source       = "../../../modules/cloudflare_zone_settings_override"
  zone_setting = var.zone_setting
}
