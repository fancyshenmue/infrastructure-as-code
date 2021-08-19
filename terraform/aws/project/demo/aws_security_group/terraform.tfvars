aws_security_group = [
  // allow ssh
  {
    name                        = "allow-ssh"
    description                 = "allow-ssh"
    vpc_id                      = "vpc-xxxxxxxxxxxxxxxxx"
    ingress_description         = ""
    ingress_from_port           = 22
    ingress_to_port             = 22
    ingress_protocol            = "tcp"
    ingress_cidr_blocks         = ["10.10.0.0/16"]
    ingress_ipv6_cidr_blocks    = []
    egress_from_port            = 0
    egress_to_port              = 0
    egress_protocol             = "-1"
    egress_cidr_blocks          = ["0.0.0.0/0"]
    egress_ipv6_cidr_blocks     = []
    tags_name                   = "allow-ssh"
    tags_all_name               = "allow-ssh"
  },
  // allow mysql
  {
    name                        = "allow-mysql"
    description                 = "allow-mysql"
    vpc_id                      = "vpc-xxxxxxxxxxxxxxxxx"
    ingress_description         = ""
    ingress_from_port           = 3306
    ingress_to_port             = 3306
    ingress_protocol            = "tcp"
    ingress_cidr_blocks         = ["10.10.0.0/16", "10.11.0.0/16"]
    ingress_ipv6_cidr_blocks    = []
    egress_from_port            = 0
    egress_to_port              = 0
    egress_protocol             = "-1"
    egress_cidr_blocks          = ["0.0.0.0/0"]
    egress_ipv6_cidr_blocks     = []
    tags_name                   = "allow-mysql"
    tags_all_name               = "allow-mysql"
  },
  // allow redis
  {
    name                        = "allow-redis"
    description                 = "allow-redis"
    vpc_id                      = "vpc-xxxxxxxxxxxxxxxxx"
    ingress_description         = ""
    ingress_from_port           = 6379
    ingress_to_port             = 6379
    ingress_protocol            = "tcp"
    ingress_cidr_blocks         = ["10.10.0.0/16", "10.11.0.0/16"]
    ingress_ipv6_cidr_blocks    = []
    egress_from_port            = 0
    egress_to_port              = 0
    egress_protocol             = "-1"
    egress_cidr_blocks          = ["0.0.0.0/0"]
    egress_ipv6_cidr_blocks     = []
    tags_name                   = "allow-redis"
    tags_all_name               = "allow-redis"
  },
  // allow cloudflare
  {
    name                        = "allow-cloudflare"
    description                 = "allow-cloudflare"
    vpc_id                      = "vpc-xxxxxxxxxxxxxxxxx"
    ingress_description         = ""
    ingress_from_port           = 80
    ingress_to_port             = 80
    ingress_protocol            = "tcp"
    ingress_cidr_blocks         = ["173.245.48.0/20", "103.21.244.0/22", "103.22.200.0/22", "103.31.4.0/22", "141.101.64.0/18", "108.162.192.0/18", "190.93.240.0/20", "188.114.96.0/20", "197.234.240.0/22", "198.41.128.0/17", "162.158.0.0/15", "104.16.0.0/12", "172.64.0.0/13", "131.0.72.0/22"]
    ingress_ipv6_cidr_blocks    = []
    egress_from_port            = 0
    egress_to_port              = 0
    egress_protocol             = "-1"
    egress_cidr_blocks          = ["0.0.0.0/0"]
    egress_ipv6_cidr_blocks     = []
    tags_name                   = "allow-cloudflare"
    tags_all_name               = "allow-cloudflare"
  },
]
