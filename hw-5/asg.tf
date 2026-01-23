resource "aws_autoscaling_group" "app_asg" {
  max_size             = 3
  min_size             = 1
  desired_capacity     = 2
  vpc_zone_identifier  = data.terraform_remote_state.network.outputs.private_subnet_ids
  health_check_type          = "EC2"
  health_check_grace_period  = 30 
  force_delete               = true

  launch_template {
    id      = aws_launch_template.launch-template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.alb-tg.arn]  
}
