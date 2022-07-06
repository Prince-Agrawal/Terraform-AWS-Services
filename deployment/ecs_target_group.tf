resource "aws_lb_target_group" "first_tf_target_group" {
  name        = var.target_group
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    path    = "/health"
    matcher = "200"
  }
}