resource "aws_lb" "first_lb_tf" {
  name               = var.load_blanacer_name
  load_balancer_type = "application"
  internal           = false
  security_groups    = var.lb_security_groups
  subnets            = var.lb_subnets
}

resource "aws_lb_listener" "listener_tf" {
  load_balancer_arn = aws_lb.first_lb_tf.id
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "listener_tf-2" {
  load_balancer_arn = aws_lb.first_lb_tf.id
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-west-2:740011792935:certificate/79cf557e-8969-47cc-999b-6d87d478a674"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.first_tf_target_group.id
  }
}

output "load_balancer_url" {
  value = aws_lb.first_lb_tf.dns_name
}