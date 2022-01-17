terraform {
  source  = "github.com/Veeps-Hosting/terraform-terragrunt-vultr//compute?ref=1.8"
}
include {
  path = find_in_parent_folders()
}
# When using the terragrunt xxx-all commands (e.g., apply-all, plan-all), deploy these dependencies before this module
dependencies {
  paths = ["../../../_global/resource_domain","../../private_network/net96"]
}

## Deploy the private network ID and use it to fill out the 'private_network_id' value below
inputs = {
  hostname           = "${basename(get_terragrunt_dir())}"
  #private_network_id = ["46e8edac-eef4-470d-880d-94b469318b6d"]
}
