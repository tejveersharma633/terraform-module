variable "nsg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "security_rules" {
  type = map(object({
    priority  = number
    direction = string
    access    = string
    protocol  = string
    src_port  = string
    dst_port  = string
  }))
}