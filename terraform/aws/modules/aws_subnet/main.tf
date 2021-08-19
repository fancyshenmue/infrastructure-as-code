resource "aws_subnet" "default" {
  count                           = length(var.aws_subnet)
  vpc_id                          = lookup(var.aws_subnet[count.index], "vpc_id")
  assign_ipv6_address_on_creation = lookup(var.aws_subnet[count.index], "assign_ipv6_address_on_creation")
  availability_zone               = lookup(var.aws_subnet[count.index], "availability_zone")
  cidr_block                      = lookup(var.aws_subnet[count.index], "cidr_block")
  map_public_ip_on_launch         = lookup(var.aws_subnet[count.index], "map_public_ip_on_launch")
  tags = {
    "Name" = lookup(var.aws_subnet[count.index], "tags_name")
  }
  tags_all = {
    "Name" = lookup(var.aws_subnet[count.index], "tags_all_name")
  }
}
