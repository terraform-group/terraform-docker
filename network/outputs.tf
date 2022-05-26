output "network" {
    value = [for net in docker_network.network: tomap({"name" = net.name, "subnet": tolist(net.ipam_config)[0].subnet })]
}