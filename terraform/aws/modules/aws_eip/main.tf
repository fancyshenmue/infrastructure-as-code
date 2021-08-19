resource "aws_eip" "default" {
  count                = length(var.aws_eip)
  network_border_group = lookup(var.aws_eip[count.index], "network_border_group")
  public_ipv4_pool     = lookup(var.aws_eip[count.index], "public_ipv4_pool")
  vpc                  = lookup(var.aws_eip[count.index], "vpc")
  tags = {
    "Name" = lookup(var.aws_eip[count.index], "tags_name")
  }
  tags_all = {
    "Name" = lookup(var.aws_eip[count.index], "tags_all_name")
  }
}
