module "aws_key_pair" {
  source       = "../../../modules/aws_key_pair"
  aws_key_pair = var.aws_key_pair
}
