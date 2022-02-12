module "template" {
  source = "../../"
  ingress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
  ]
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]
  group = {
    name        = "ForTemplate"
    description = "test of a not empty SG"
    vpc_id      = "vpc-0c33dc8cd64f408c4"
  }
  template = {
    description = "examplea"

    image_id      = "ami-0e0b657c074a17ec0"
    instance_type = "t2.micro"
    name          = "examplea"
  }
  disk = {
    device_name = "/dev/xvda"
    ebs = {
      delete_on_termination = true
      encrypted             = false
      iops                  = 0
      snapshot_id           = "snap-00f61283bf19fc8c7"
      throughput            = 125
      volume_size           = 8
      volume_type           = "standard"
    }
  }
}
