resource "aws_iam_group_policy_attachment" "default" {
  count      = length(var.aws_iam_group_policy_attachment)
  group      = lookup(var.aws_iam_group_policy_attachment[count.index], "group")
  policy_arn = lookup(var.aws_iam_group_policy_attachment[count.index], "policy_arn")
}
