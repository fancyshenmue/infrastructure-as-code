resource "cloudflare_argo" "default" {
  count          = length(var.cloudflare_argo)
  zone_id        = lookup(var.cloudflare_argo[count.index], "zone_id")
  tiered_caching = lookup(var.cloudflare_argo[count.index], "tiered_caching")
  smart_routing  = lookup(var.cloudflare_argo[count.index], "smart_routing")
}
