provider "docker" {
  host = "tcp://192.168.1.200:2375"
  # Configuration options
}

data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "../network/terraform.tfstate"
  }
}

# output "name" {
#   value = data.terraform_remote_state.network.outputs
# }
