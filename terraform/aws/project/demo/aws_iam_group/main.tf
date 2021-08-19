module "aws_iam_group" {
  source        = "../../../modules/aws_iam_group"
  aws_iam_group = var.aws_iam_group
}
