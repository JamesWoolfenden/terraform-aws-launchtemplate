resource "aws_launch_template" "examplea" {
  description = var.template.description

  image_id      = var.template.image_id
  instance_type = var.template.instance_type
  name          = var.template.name
  vpc_security_group_ids = [
    aws_security_group.example.id
  ]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  block_device_mappings {
    device_name = var.disk.device_name

    ebs {
      delete_on_termination = var.disk.ebs.delete_on_termination
      encrypted             = var.disk.ebs.encrypted
      iops                  = var.disk.ebs.iops
      snapshot_id           = var.disk.ebs.snapshot_id
      throughput            = var.disk.ebs.throughput
      volume_size           = var.disk.ebs.volume_size
      volume_type           = var.disk.ebs.volume_type
    }
  }
}

variable "template" {
  type = object({
    description   = string
    image_id      = string
    instance_type = string
    name          = string
  })
}

variable "disk" {
  type = object(
    {
      device_name = string

      ebs = object({
        delete_on_termination = bool
        encrypted             = bool
        iops                  = number
        snapshot_id           = string
        throughput            = number
        volume_size           = number
        volume_type           = string
      })
    }
  )
}
