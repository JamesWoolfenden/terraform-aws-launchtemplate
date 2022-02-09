
variable "group" {
  type = object({
    name        = string
    description = string
    vpc_id      = string
  })
  description = "(optional) describe your variable"
}


variable "ingress" {
  type = list(object({
    cidr_blocks      = list(string)
    description      = string
    from_port        = number
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    protocol         = string
    security_groups  = list(string)
    self             = bool
    to_port          = number
  }))
}

variable "egress" {
  type = list(object({
    cidr_blocks      = list(string)
    description      = string
    from_port        = number
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    protocol         = string
    security_groups  = list(string)
    self             = bool
    to_port          = number
  }))
}

