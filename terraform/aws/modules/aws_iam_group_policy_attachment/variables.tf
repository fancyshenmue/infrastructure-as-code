variable "aws_iam_group_policy_attachment" {
  type = list(object({
    group      = string
    policy_arn = string
  }))
  default = [
    {
      group      = ""
      policy_arn = ""
    }
  ]
  description = "AWS IAM Group Policy Attachment"
}
