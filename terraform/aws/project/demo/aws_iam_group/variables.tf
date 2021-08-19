variable "aws_iam_group" {
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
  description = "AWS IAM Group"
}
