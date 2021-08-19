resource "aws_security_group" "default" {
  count       = length(var.aws_security_group)
  name        = lookup(var.aws_security_group[count.index], "name")
  description = lookup(var.aws_security_group[count.index], "description")
  vpc_id      = lookup(var.aws_security_group[count.index], "vpc_id")

  ingress {
    description      = lookup(var.aws_security_group[count.index], "ingress_description")
    from_port        = lookup(var.aws_security_group[count.index], "ingress_from_port")
    to_port          = lookup(var.aws_security_group[count.index], "ingress_to_port")
    protocol         = lookup(var.aws_security_group[count.index], "ingress_protocol")
    cidr_blocks      = lookup(var.aws_security_group[count.index], "ingress_cidr_blocks")
    ipv6_cidr_blocks = lookup(var.aws_security_group[count.index], "ingress_ipv6_cidr_blocks")
  }

  egress {
    from_port        = lookup(var.aws_security_group[count.index], "egress_from_port")
    to_port          = lookup(var.aws_security_group[count.index], "egress_to_port")
    protocol         = lookup(var.aws_security_group[count.index], "egress_protocol")
    cidr_blocks      = lookup(var.aws_security_group[count.index], "egress_cidr_blocks")
    ipv6_cidr_blocks = lookup(var.aws_security_group[count.index], "egress_ipv6_cidr_blocks")
  }

  tags = {
    Name = lookup(var.aws_security_group[count.index], "tags_name")
  }

  tags_all = {
    Name = lookup(var.aws_security_group[count.index], "tags_all_name")
  }
}
