resource "aws_security_group" "example" {

  description = var.group.description
  egress      = var.egress
  ingress     = var.ingress

  name = var.group.name

  revoke_rules_on_delete = false
  vpc_id                 = var.group.vpc_id

  timeouts {}
}
