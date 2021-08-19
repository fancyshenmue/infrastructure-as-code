module "cloudflare_zone" {
  source = "../../../modules/cloudflare_zone"
  zone   = var.zone
}
