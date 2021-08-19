resource "aws_key_pair" "default" {
  count      = length(var.aws_key_pair)
  key_name   = lookup(var.aws_key_pair[count.index], "key_name")
  public_key = lookup(var.aws_key_pair[count.index], "public_key")
}
