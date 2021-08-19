variable "aws_eip" {
  type = list(object({
    network_border_group = string
    public_ipv4_pool     = string
    vpc                  = bool
    tags_name            = string
    tags_all_name        = string
  }))
  default = [
    {
      network_border_group = ""
      public_ipv4_pool     = ""
      vpc                  = true
      tags_name            = ""
      tags_all_name        = ""
    }
  ]
  description = "AWS EIP"
}
