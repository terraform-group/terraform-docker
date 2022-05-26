provider "docker" {
  host = "tcp://192.168.1.200:2375"
  # Configuration options
}

locals {
  network_settings = [
    {
      name   = "devops1"
      driver = "bridge"
      subnet = "10.1.0.0/24"
    }
  ]
}

resource "docker_network" "network" {
  count  = length(local.network_settings)
  name   = local.network_settings[count.index]["name"]
  driver = local.network_settings[count.index]["driver"]
  ipam_config {
    subnet = local.network_settings[count.index]["subnet"]
  }
}