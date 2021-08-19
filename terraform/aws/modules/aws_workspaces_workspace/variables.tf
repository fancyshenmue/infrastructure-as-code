variable "aws_workspaces_workspace" {
  type = list(object({
    bundle_id                                                      = string
    directory_id                                                   = string
    user_name                                                      = string
    root_volume_encryption_enabled                                 = bool
    user_volume_encryption_enabled                                 = bool
    workspace_properties_compute_type_name                         = string
    workspace_properties_running_mode                              = string
    workspace_properties_running_mode_auto_stop_timeout_in_minutes = string
    workspace_properties_root_volume_size_gib                      = number
    workspace_properties_user_volume_size_gib                      = number
  }))
  default = [
    {
      bundle_id                                                      = ""
      directory_id                                                   = ""
      user_name                                                      = ""
      root_volume_encryption_enabled                                 = false
      user_volume_encryption_enabled                                 = false
      workspace_properties_compute_type_name                         = ""
      workspace_properties_running_mode                              = ""
      workspace_properties_running_mode_auto_stop_timeout_in_minutes = ""
      workspace_properties_root_volume_size_gib                      = 80
      workspace_properties_user_volume_size_gib                      = 50
    }
  ]
  description = "AWS Workspaces"
}
