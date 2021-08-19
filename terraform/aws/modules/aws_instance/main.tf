resource "aws_instance" "default" {
  count                                = length(var.aws_instance)
  availability_zone                    = lookup(var.aws_security_group[count.index], "availability_zone")
  private_ip                           = lookup(var.aws_security_group[count.index], "private_ip")
  associate_public_ip_address          = lookup(var.aws_security_group[count.index], "associate_public_ip_address")
  instance_type                        = lookup(var.aws_security_group[count.index], "instance_type")
  cpu_core_count                       = lookup(var.aws_security_group[count.index], "cpu_core_count")
  cpu_threads_per_core                 = lookup(var.aws_security_group[count.index], "cpu_threads_per_core")
  subnet_id                            = lookup(var.aws_security_group[count.index], "subnet_id")
  key_name                             = lookup(var.aws_security_group[count.index], "key_name")
  ami                                  = lookup(var.aws_security_group[count.index], "ami")
  disable_api_termination              = lookup(var.aws_security_group[count.index], "disable_api_termination")
  ebs_optimized                        = lookup(var.aws_security_group[count.index], "ebs_optimized")
  get_password_data                    = lookup(var.aws_security_group[count.index], "get_password_data")
  hibernation                          = lookup(var.aws_security_group[count.index], "hibernation")
  instance_initiated_shutdown_behavior = lookup(var.aws_security_group[count.index], "instance_initiated_shutdown_behavior")
  ipv6_address_count                   = lookup(var.aws_security_group[count.index], "ipv6_address_count")
  ipv6_addresses                       = []
  monitoring                           = lookup(var.aws_security_group[count.index], "monitoring")
  secondary_private_ips                = []
  security_groups                      = []
  source_dest_check                    = lookup(var.aws_security_group[count.index], "source_dest_check")
  tags = {
    "Name" = lookup(var.aws_security_group[count.index], "tags_name")
  }
  tags_all = {
    "Name" = lookup(var.aws_security_group[count.index], "tags_all_name")
  }
  tenancy                = lookup(var.aws_security_group[count.index], "tenancy")
  vpc_security_group_ids = [split(",", lookup(var.aws_security_group[count.index], "vpc_security_group_ids"))]

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }

  root_block_device {
    delete_on_termination = lookup(var.aws_security_group[count.index], "root_block_device_delete_on_termination")
    encrypted             = lookup(var.aws_security_group[count.index], "root_block_device_encrypted")
    iops                  = lookup(var.aws_security_group[count.index], "root_block_device_iops")
    tags                  = {}
    throughput            = lookup(var.aws_security_group[count.index], "root_block_device_throughput")
    volume_size           = lookup(var.aws_security_group[count.index], "root_block_device_volume_size")
    volume_type           = lookup(var.aws_security_group[count.index], "root_block_device_volume_type")
  }

  ebs_block_device {
    delete_on_termination = lookup(var.aws_security_group[count.index], "ebs_block_device_delete_on_termination")
    device_name           = lookup(var.aws_security_group[count.index], "ebs_block_device_device_name")
    encrypted             = lookup(var.aws_security_group[count.index], "ebs_block_device_encrypted")
    iops                  = lookup(var.aws_security_group[count.index], "ebs_block_device_iops")
    tags                  = {}
    throughput            = lookup(var.aws_security_group[count.index], "ebs_block_device_throughput")
    volume_size           = lookup(var.aws_security_group[count.index], "ebs_block_device_volume_size")
    volume_type           = lookup(var.aws_security_group[count.index], "ebs_block_device_volume_type")
  }

  enclave_options {
    enabled = false
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
}
