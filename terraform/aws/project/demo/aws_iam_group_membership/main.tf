module "aws_iam_group_membership" {
  source                   = "../../../modules/aws_iam_group_membership"
  aws_iam_group_membership = var.aws_iam_group_membership
}
