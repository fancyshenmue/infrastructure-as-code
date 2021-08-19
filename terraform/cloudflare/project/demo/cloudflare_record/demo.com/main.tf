module "cloudflare_record_a" {
  source              = "../../../../../modules/cloudflare_record/a"
  cloudflare_record_a = var.cloudflare_record_a
}

module "cloudflare_record_cname" {
  source                  = "../../../../../modules/cloudflare_record/cname"
  cloudflare_record_cname = var.cloudflare_record_cname
}

module "cloudflare_record_txt" {
  source                = "../../../../../modules/cloudflare_record/txt"
  cloudflare_record_txt = var.cloudflare_record_txt
}

module "cloudflare_record_mx" {
  source               = "../../../../../modules/cloudflare_record/mx"
  cloudflare_record_mx = var.cloudflare_record_mx
}

module "cloudflare_record_ns" {
  source               = "../../../../../modules/cloudflare_record/ns"
  cloudflare_record_ns = var.cloudflare_record_ns
}
