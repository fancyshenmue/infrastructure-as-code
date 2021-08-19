variable "aws_subnet" {
  type = list(object({
    vpc_id                          = string
    availability_zone               = string
    cidr_block                      = string
    assign_ipv6_address_on_creation = bool
    map_public_ip_on_launch         = bool
    tags_name                       = string
    tags_all_name                   = string
  }))
  default = [
    {
      vpc_id                          = ""
      availability_zone               = ""
      cidr_block                      = ""
      assign_ipv6_address_on_creation = false
      map_public_ip_on_launch         = false
      tags_name                       = ""
      tags_all_name                   = ""
    }
  ]
  description = "AWS Subnet"
}
