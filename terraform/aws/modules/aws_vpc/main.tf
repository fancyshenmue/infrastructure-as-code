resource "aws_vpc" "default" {
  count                            = length(var.aws_vpc)
  instance_tenancy                 = lookup(var.aws_vpc[count.index], "instance_tenancy")
  assign_generated_ipv6_cidr_block = lookup(var.aws_vpc[count.index], "assign_generated_ipv6_cidr_block")
  cidr_block                       = lookup(var.aws_vpc[count.index], "cidr_block")
  enable_classiclink               = lookup(var.aws_vpc[count.index], "enable_classiclink")
  enable_classiclink_dns_support   = lookup(var.aws_vpc[count.index], "enable_classiclink_dns_support")
  enable_dns_hostnames             = lookup(var.aws_vpc[count.index], "enable_dns_hostnames")
  enable_dns_support               = lookup(var.aws_vpc[count.index], "enable_dns_support")
  tags = {
    "Name" = lookup(var.aws_vpc[count.index], "tags_name")
  }
  tags_all = {
    "Name" = lookup(var.aws_vpc[count.index], "tags_all_name")
  }
}
