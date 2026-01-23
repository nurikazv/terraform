resource "aws_lb" "app-lb" {
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.sg_alb.id]
    subnets = data.terraform_remote_state.network.outputs.public_subnet_ids
    enable_deletion_protection = false

    ip_address_type = "dualstack"
}

