variable "zone" {
  type = list(object({
    zone       = string
    paused     = bool
    jump_start = bool
    plan       = string
    type       = string
  }))
  default = [
    {
      zone       = ""
      paused     = false
      jump_start = false
      plan       = "free"
      type       = "full"
    }
  ]
  description = "Cloudflare Zone"
}
