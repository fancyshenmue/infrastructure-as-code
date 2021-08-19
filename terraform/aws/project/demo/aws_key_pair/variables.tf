variable "aws_key_pair" {
  type = list(object({
    key_name   = string
    public_key = string
  }))
  default = [
    {
      key_name   = ""
      public_key = ""
    }
  ]
  description = "AWS Key Pair"
}
