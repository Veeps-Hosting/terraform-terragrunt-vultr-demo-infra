terraform {
  source  = "github.com/Veeps-Hosting/terraform-terragrunt-vultr//compute?ref=1.8"
}
include {
  path = find_in_parent_folders()
}
# When using the terragrunt xxx-all commands (e.g., apply-all, plan-all), deploy these dependencies before this module
dependencies {
  paths = ["../../../_global/resource_domain"]
}

inputs = {
  hostname = "${basename(get_terragrunt_dir())}"
}
