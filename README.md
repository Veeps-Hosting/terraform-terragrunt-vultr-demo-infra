# terraform-terragrunt-vultr-demo-infra

Deploy a fully functional set of Infrastructure components on the Vultr provider using Terraform and Terragrunt.

## Prerequisites & Assumptions
- AWS Account Setup with an IAM keypair and S3 bucket and DynamoDB table for the State storage
- Registered resource domain pointing to Vultr nameservers (ns1.vultr.com & ns2.vultr.com)
- A paid Vultr account with API key generated and the public IP of the deployment source permitted
- Terraform v1.1.3 installed under $PATH, although most recent versions should work
- Terragrunt 0.29.3 installed under $PATH, although most recent versions should work
- Environment variables exported, eg. "export TERRAGRUNT_DOWNLOAD=/tmp" for the required variables: VULTR_API_KEY, AWS_SECRET_ACCESS_KEY & AWS_ACCESS_KEY_ID in the local shell or build Environment

## Build Stage 1: _global
After updating all variables in the code base with desired values, eg. domain, region, S3 bucket, dynamodb_table, any additional or different firewall rules, SSH public key or startup script steps, change into the 'main/_global' path and execute the command `terragrunt run-all apply`.

This will create:
- A resource domain for fully qualified lookups of future servers
- A basic firewall config allowing SSH and Web Ports
- A basic startup script for "Hello World!" proof of concept

## Build Stage 2: Block Storage
Change to the path 'main/vultr-demo-nj/block_storage/block_storage1_vdb' and execute the command `terragrunt run-all apply` again. This example could be used for backup targets and scaling up storage capacity without increasing compute.
- Builds the minimum sized 10G block storage, as well as;
- Minimal compute (server) to mount the block storage on, including forward+reverse DNS entries, bi-weekly backups enabled, using the example firewall group and startup script (Ubuntu LTS OS)

## Build Stage 3: Compute (servers) & Private Network
Please note the ability to add private networks to computer (servers) required manual dependency satisfaction due to standalone servers not requiring the private network.
To work with this example, go to the folder 'main/vultr-demo/private_network/net96' and run `terragrunt apply` *first, before* noting the ID output at the end. Fill in this value for the servers under paths 'main/vultr-demo/compute/private_network*'. Then change to the path 1 level up 'main/vultr-demo/compute' and again run `terragrunt run-all apply`.
- Builds a standalone webserver to demonstrate "Hello World!" or "Welcome to NGiNX", again running Ubuntu LTS with forward+reverse DNS entries, startup script and SSH public key.
- Builds 2x servers connected via the private network link Identified above, so they can communicate with each other, again with a basic webserver demo from the script.
After waiting for around 5 minutes and a reboot, visiting the URL for the server automatically created in DNS you should see a website response. Additionally the 2x servers with private network configured will be able to ping each other.

**Removal**: Change to the 'main/' folder and execute `terragrunt run-all destroy` 
