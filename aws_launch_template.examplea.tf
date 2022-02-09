resource "aws_launch_template" "examplea" {
  description = "examplea"

  image_id      = "ami-0e0b657c074a17ec0"
  instance_type = "t2.micro"
  name          = "examplea"
  tags          = {}
  vpc_security_group_ids = [
    aws_security_group.example.id
  ]


  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      encrypted             = "false"
      iops                  = 0
      snapshot_id           = "snap-00f61283bf19fc8c7"
      throughput            = 125
      volume_size           = 8
      volume_type           = "standard"
    }
  }
}
