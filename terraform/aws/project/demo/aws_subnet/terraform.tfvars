aws_subnet = [
  // workspaces-subnet
  {
    vpc_id                          = "vpc-xxxxxxxxxxxxxxxxx"
    availability_zone               = "ap-northeast-1c"
    cidr_block                      = "10.10.0.0/24"
    assign_ipv6_address_on_creation = false
    map_public_ip_on_launch         = false
    tags_name                       = "workspaces-public-subnet"
    tags_all_name                   = "workspaces-public-subnet"
  },
  {
    vpc_id                          = "vpc-xxxxxxxxxxxxxxxxx"
    availability_zone               = "ap-northeast-1a"
    cidr_block                      = "10.10.1.0/24"
    assign_ipv6_address_on_creation = false
    map_public_ip_on_launch         = false
    tags_name                       = "workspaces-private-subnet-1"
    tags_all_name                   = "workspaces-private-subnet-1"
  },
  {
    vpc_id                          = "vpc-xxxxxxxxxxxxxxxxx"
    availability_zone               = "ap-northeast-1c"
    cidr_block                      = "10.10.2.0/24"
    assign_ipv6_address_on_creation = false
    map_public_ip_on_launch         = false
    tags_name                       = "workspaces-private-subnet-2"
    tags_all_name                   = "workspaces-private-subnet-2"
  },
  // eks-ap-northeast-1-demo-subnet
  {
    vpc_id                          = "vpc-xxxxxxxxxxxxxxxxx"
    availability_zone               = "ap-northeast-1a"
    cidr_block                      = "10.11.0.0/24"
    assign_ipv6_address_on_creation = false
    map_public_ip_on_launch         = false
    tags_name                       = "eks-ap-northeast-1-demo-public-subnet-1"
    tags_all_name                   = "eks-ap-northeast-1-demo-public-subnet-1"
  },
  {
    vpc_id                          = "vpc-xxxxxxxxxxxxxxxxx"
    availability_zone               = "ap-northeast-1c"
    cidr_block                      = "10.11.1.0/24"
    assign_ipv6_address_on_creation = false
    map_public_ip_on_launch         = false
    tags_name                       = "eks-ap-northeast-1-demo-public-subnet-2"
    tags_all_name                   = "eks-ap-northeast-1-demo-public-subnet-2"
  },
  {
    vpc_id                          = "vpc-xxxxxxxxxxxxxxxxx"
    availability_zone               = "ap-northeast-1a"
    cidr_block                      = "10.11.2.0/24"
    assign_ipv6_address_on_creation = false
    map_public_ip_on_launch         = false
    tags_name                       = "eks-ap-northeast-1-demo-private-subnet-1"
    tags_all_name                   = "eks-ap-northeast-1-demo-private-subnet-1"
  },
  {
    vpc_id                          = "vpc-xxxxxxxxxxxxxxxxx"
    availability_zone               = "ap-northeast-1c"
    cidr_block                      = "10.11.3.0/24"
    assign_ipv6_address_on_creation = false
    map_public_ip_on_launch         = false
    tags_name                       = "eks-ap-northeast-1-demo-private-subnet-2"
    tags_all_name                   = "eks-ap-northeast-1-demo-private-subnet-2"
  },
]
