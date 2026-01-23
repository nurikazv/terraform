resource "aws_security_group" "ec2-sg" {
  name        = var.sg
  description = "Security group for instances"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
}

resource "aws_security_group_rule" "ingress-ec2" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ec2-sg.id
  source_security_group_id = aws_security_group.sg_alb.id
}

# Egress all
resource "aws_security_group_rule" "egress-ec2" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-sg.id
}