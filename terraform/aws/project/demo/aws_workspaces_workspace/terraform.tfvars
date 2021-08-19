aws_workspaces_workspace = [
  // admin
  {
    bundle_id = "wsb-xxxxxxxxx"
    directory_id = "d-xxxxxxxxxx"
    user_name = "admin"
    root_volume_encryption_enabled = false
    user_volume_encryption_enabled = false
    workspace_properties_compute_type_name = "STANDARD"
    workspace_properties_running_mode = "ALWAYS_ON"
    workspace_properties_running_mode_auto_stop_timeout_in_minutes = 0
    workspace_properties_root_volume_size_gib = 80
    workspace_properties_user_volume_size_gib = 50
  },
  // demo
  {
    bundle_id = "wsb-clj85qzj1"
    directory_id = "d-xxxxxxxxxx"
    user_name = "demo"
    root_volume_encryption_enabled = false
    user_volume_encryption_enabled = false
    workspace_properties_compute_type_name = "STANDARD"
    workspace_properties_running_mode = "ALWAYS_ON"
    workspace_properties_running_mode_auto_stop_timeout_in_minutes = 0
    workspace_properties_root_volume_size_gib = 80
    workspace_properties_user_volume_size_gib = 50
  },
  // demo2
  {
    bundle_id = "wsb-xxxxxxxxx"
    directory_id = "d-xxxxxxxxxx"
    user_name = "demo2"
    root_volume_encryption_enabled = false
    user_volume_encryption_enabled = false
    workspace_properties_compute_type_name = "STANDARD"
    workspace_properties_running_mode = "ALWAYS_ON"
    workspace_properties_running_mode_auto_stop_timeout_in_minutes = 0
    workspace_properties_root_volume_size_gib = 80
    workspace_properties_user_volume_size_gib = 50
  },
]
