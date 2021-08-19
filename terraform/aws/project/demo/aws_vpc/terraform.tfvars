aws_vpc = [
  // workspaces-vpc
  {
    instance_tenancy                 = "default"
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "10.10.0.0/16"
    enable_classiclink               = false
    enable_classiclink_dns_support   = false
    enable_dns_hostnames             = true
    enable_dns_support               = true
    tags_name                        = "workspaces-vpc"
    tags_all_name                    = "workspaces-vpc"
  },
  // eks-ap-northeast-1-demo
  {
    instance_tenancy                 = "default"
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "10.11.0.0/16"
    enable_classiclink               = false
    enable_classiclink_dns_support   = false
    enable_dns_hostnames             = true
    enable_dns_support               = true
    tags_name                        = "eks-ap-northeast-1-demo"
    tags_all_name                    = "eks-ap-northeast-1-demo"
  },
]
