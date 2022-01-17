terraform {
  source = "github.com/Veeps-Hosting/terraform-terragrunt-vultr//dns_domain?ref=1.8"
}
include {
  path = find_in_parent_folders()
}

# This presumes a single resource domains for all resources
# If desiring 1 per region, move this from '_global' to elsewhere in the tree
inputs = {
  resource_domain         = "your-infra-domain.resources"
  resource_domain_apex_ip = "127.1.1.1"
}
