variable "nsgassociation" {
  type = map(object({
    network_interface_ids      = string
    network_security_group_id  = string
  }))
}