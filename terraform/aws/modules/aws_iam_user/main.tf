resource "aws_iam_user" "default" {
  count = length(var.aws_iam_user)
  name  = lookup(var.aws_iam_user[count.index], "name")
  path  = lookup(var.aws_iam_user[count.index], "path")
}
