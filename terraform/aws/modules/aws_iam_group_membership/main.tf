resource "aws_iam_group_membership" "default" {
  count = length(var.aws_iam_group_membership)
  name  = lookup(var.aws_iam_group_membership[count.index], "name")
  group = lookup(var.aws_iam_group_membership[count.index], "group")
  users = lookup(var.aws_iam_group_membership[count.index], "users")
}
