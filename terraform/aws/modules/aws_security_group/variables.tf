variable "aws_security_group" {
  type = list(object({
    name                     = string
    description              = string
    vpc_id                   = string
    ingress_description      = string
    ingress_from_port        = number
    ingress_to_port          = number
    ingress_protocol         = string
    ingress_cidr_blocks      = list(string)
    ingress_ipv6_cidr_blocks = list(string)
    egress_from_port         = number
    egress_to_port           = number
    egress_protocol          = string
    egress_cidr_blocks       = list(string)
    egress_ipv6_cidr_blocks  = list(string)
    tags_name                = string
    tags_all_name            = string
  }))
  default = [
    {
      name                     = ""
      description              = ""
      vpc_id                   = ""
      ingress_description      = ""
      ingress_from_port        = 0
      ingress_to_port          = 0
      ingress_protocol         = "-1"
      ingress_cidr_blocks      = []
      ingress_ipv6_cidr_blocks = []
      egress_from_port         = 0
      egress_to_port           = 0
      egress_protocol          = "-1"
      egress_cidr_blocks       = ["0.0.0.0/0"]
      egress_ipv6_cidr_blocks  = ["::/0"]
      tags_name                = ""
      tags_all_name            = ""
    }
  ]
  description = "AWS Security Group"
}
