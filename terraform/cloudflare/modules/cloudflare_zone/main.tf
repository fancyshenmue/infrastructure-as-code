resource "cloudflare_zone" "default" {
  count = length(var.zone)

  zone       = lookup(var.zone[count.index], "zone")
  paused     = lookup(var.zone[count.index], "paused")
  jump_start = lookup(var.zone[count.index], "jump_start")
  plan       = lookup(var.zone[count.index], "plan")
  type       = lookup(var.zone[count.index], "type")
}
