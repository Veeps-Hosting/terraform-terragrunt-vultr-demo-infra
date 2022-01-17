terraform {
 source  = "github.com/Veeps-Hosting/terraform-terragrunt-vultr//block_storage?ref=1.8"
}
include {
  path = find_in_parent_folders()
}
# When using the terragrunt xxx-all commands (e.g., apply-all, plan-all), deploy these dependencies before this module
dependencies {
  paths = ["../../compute/block_storage1"]
}

# Block storage must be deployed in a supported region (NY/NJ, LA, Tokyo)
# This example is in NJ
# Manual dependency satisfaction is required Compute before Block Storage
inputs = {
  attach_to = "block_storage1"
  label     = "block_storage1_vdb"
  size_gb   = "10"
}
