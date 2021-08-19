module "aws_iam_group_policy_attachment" {
  source                          = "../../../modules/aws_iam_group_policy_attachment"
  aws_iam_group_policy_attachment = var.aws_iam_group_policy_attachment
}
