variable "aws_iam_user" {
  type = list(object({
    name = string
    path = string
  }))
  default = [
    {
      name = ""
      path = ""
    }
  ]
  description = "AWS IAM User"
}
