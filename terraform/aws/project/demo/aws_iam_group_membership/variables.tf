variable "aws_iam_group_membership" {
  type = list(object({
    name  = string
    group = string
    users = list(string)
  }))
  default = [
    {
      name  = ""
      group = ""
      users = []
    }
  ]
  description = "AWS IAM Group Membership"
}
