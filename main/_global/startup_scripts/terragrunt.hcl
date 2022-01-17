terraform {
  source = "github.com/Veeps-Hosting/terraform-terragrunt-vultr//startup_scripts?ref=1.8"
}
include {
  path = find_in_parent_folders()
}

## Customise this script or add another one with a different name between the CONTENT tags
inputs = {
  startup_script = {
    "bootstrap" = {
      content = <<CONTENT
#!/bin/bash
apt update
apt -y install nginx net-tools
ufw allow 22
ufw allow 80
apt -y upgrade
init 6
      CONTENT
    }
  }
}
