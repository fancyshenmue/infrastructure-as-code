aws_eip = [
  // workspaces-eip
  {
    network_border_group = "ap-northeast-1"
    public_ipv4_pool     = "amazon"
    vpc                  = true
    tags_name            = "workspaces-eip"
    tags_all_name        = "workspaces-eip"
  },
  // ap-northeast-1-demo-eip-1
  {
    network_border_group = "ap-northeast-1"
    public_ipv4_pool     = "amazon"
    vpc                  = true
    tags_name            = "ap-northeast-1-demo-eip-1"
    tags_all_name        = "ap-northeast-1-demo-eip-1"
  },
  // ap-northeast-1-demo-eip-2
  {
    network_border_group = "ap-northeast-1"
    public_ipv4_pool     = "amazon"
    vpc                  = true
    tags_name            = "ap-northeast-1-demo-eip-2"
    tags_all_name        = "ap-northeast-1-demo-eip-2"
  },
]
