resource "aws_lb_target_group" "alb-tg" {
  target_type = "instance" 
  port        = 80
  protocol    = "HTTP"    
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  health_check {
    protocol = "HTTP"
  }
}