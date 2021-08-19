resource "aws_iam_group" "default" {
  count = length(var.aws_iam_group)
  name  = lookup(var.aws_iam_group[count.index], "name")
  path  = lookup(var.aws_iam_group[count.index], "path")
}
