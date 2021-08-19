resource "aws_workspaces_workspace" "default" {
  count                          = length(var.aws_workspaces_workspace)
  bundle_id                      = lookup(var.aws_workspaces_workspace[count.index], "bundle_id")
  directory_id                   = lookup(var.aws_workspaces_workspace[count.index], "directory_id")
  user_name                      = lookup(var.aws_workspaces_workspace[count.index], "user_name")
  tags                           = {}
  tags_all                       = {}
  root_volume_encryption_enabled = lookup(var.aws_workspaces_workspace[count.index], "root_volume_encryption_enabled")
  user_volume_encryption_enabled = lookup(var.aws_workspaces_workspace[count.index], "user_volume_encryption_enabled")

  workspace_properties {
    compute_type_name                         = lookup(var.aws_workspaces_workspace[count.index], "workspace_properties_compute_type_name")
    running_mode                              = lookup(var.aws_workspaces_workspace[count.index], "workspace_properties_running_mode")
    running_mode_auto_stop_timeout_in_minutes = lookup(var.aws_workspaces_workspace[count.index], "workspace_properties_running_mode_auto_stop_timeout_in_minutes")
    root_volume_size_gib                      = lookup(var.aws_workspaces_workspace[count.index], "workspace_properties_root_volume_size_gib")
    user_volume_size_gib                      = lookup(var.aws_workspaces_workspace[count.index], "workspace_properties_user_volume_size_gib")
  }
}
