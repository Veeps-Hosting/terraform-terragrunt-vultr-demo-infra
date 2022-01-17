terraform {
  source = "github.com/Veeps-Hosting/terraform-terragrunt-vultr//ssh_keys?ref=1.8"
}
include {
  path = find_in_parent_folders()
}

## Add your id_rsa.pub public key below instead of the example.
inputs = {
  users_keys = {
    vultr-demo = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwIOhYXeCsXp95PEgFyuTnUDna30KvwDkdOg8FPhGZ9UzAFWpgPVkLkMoDMg0rEOK0yp/y4kRjNapczRrV+lzVcFF8iLa6KR1BZ/eKyolHRXBLQb5Uyup442NgkWqemQoRwthoV2+JUwMJ39h0eMjiEoWT4PbyM+VjRgFQ5XH6WY7Is8J3CeWKcrO9l8dv/dTvayXuyoduKO0TKOhHVR07nvSzT632EJHR7mktQjwYs1wV47Bilv+oXl52QQAzfuyAgmdqcseuM6GgehBob4P5mw4X0fkgpof4BWEJ8TNpXjNmyaV1fmPxnjBc0u/++k2G1SvjfWigkEA2pSFr5nd6"
  }
}
