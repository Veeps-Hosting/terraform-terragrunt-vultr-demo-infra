# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  aws_account_id             = "your-aws-account-id"
  terraform_state_s3_bucket  = "your-infra-domain.resources"
  terraform_state_aws_region = "ap-southeast-2"
  ssh_key                    = "vultr-demo"
}
