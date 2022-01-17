terraform {
  source = "github.com/Veeps-Hosting/terraform-terragrunt-vultr//firewall?ref=1.8"
}
include {
  path = find_in_parent_folders()
}

inputs = {
  fwgroup = {
    web_ssh_ping = {}
  }
  fwrule = {
    ssh = {
      fwgroup     = "web_ssh_ping"
      port        = 22
    }
    icmp = {
      fwgroup     = "web_ssh_ping"
      proto       = "icmp"
    }
    http = {
      fwgroup     = "web_ssh_ping"
      port        = 80  
    }
  }
}
