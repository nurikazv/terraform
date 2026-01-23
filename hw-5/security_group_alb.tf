resource "aws_security_group" "sg_alb" {
  name = "${var.sg}-alb"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

}

resource "aws_security_group_rule" "alb_sg_ingress" {
  for_each = {
    http  = 80
    https = 443
  }

  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg_alb.id
}

resource "aws_security_group_rule" "alb_sg_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_alb.id
}