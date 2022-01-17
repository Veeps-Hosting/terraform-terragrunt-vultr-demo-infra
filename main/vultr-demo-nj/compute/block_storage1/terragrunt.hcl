terraform {
  source  = "github.com/Veeps-Hosting/terraform-terragrunt-vultr//compute?ref=1.8"
}
include {
  path = find_in_parent_folders()
}

inputs = {
  hostname = "${basename(get_terragrunt_dir())}"
}
