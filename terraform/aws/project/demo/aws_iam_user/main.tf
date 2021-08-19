module "aws_iam_user" {
  source       = "../../../modules/aws_iam_user"
  aws_iam_user = var.aws_iam_user
}
