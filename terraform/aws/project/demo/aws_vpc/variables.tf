variable "aws_vpc" {
  type = list(object({
    instance_tenancy                 = string
    assign_generated_ipv6_cidr_block = bool
    cidr_block                       = string
    enable_classiclink               = bool
    enable_classiclink_dns_support   = bool
    enable_dns_hostnames             = bool
    enable_dns_support               = bool
    tags_name                        = string
    tags_all_name                    = string
  }))
  default = [
    {
      instance_tenancy                 = "default"
      assign_generated_ipv6_cidr_block = false
      cidr_block                       = ""
      enable_classiclink               = false
      enable_classiclink_dns_support   = false
      enable_dns_hostnames             = true
      enable_dns_support               = true
      tags_name                        = ""
      tags_all_name                    = ""
    }
  ]
  description = "AWS VPC"
}
