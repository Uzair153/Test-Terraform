
//creating security group
resource "aws_security_group" "SG" {
  name        = var.SG_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]

    }
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["10.0.0.0/16"]
    ipv6_cidr_blocks = ["fd00::/8"]
    description      = "Allow all outbound traffic"
  }

  tags = {
    Name = var.SG_tag
  }
}

output "aws_security_group" {
  value = aws_security_group.SG.id

}
