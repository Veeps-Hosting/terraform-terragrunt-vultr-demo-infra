terraform {
  source = "github.com/Veeps-Hosting/terraform-terragrunt-vultr//private_network?ref=1.8"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  description = "private_networking_net96_192.168.96.0/24"
  subnet      = "192.168.96.0"
}
