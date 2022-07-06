resource "aws_ecs_service" "first_tf_service" {
  name                 = var.service_name
  launch_type          = "FARGATE"
  task_definition      = aws_ecs_task_definition.first_task_defination_tf.arn
  cluster              = aws_ecs_cluster.first_tf_cluster.id
  desired_count        = 1
  force_new_deployment = true
  load_balancer {
    target_group_arn = aws_lb_target_group.first_tf_target_group.arn
    container_name   = "sample"
    container_port   = var.container_port
  }
  network_configuration {
    security_groups  = var.service_security_groups
    subnets          = var.service_subnets
    assign_public_ip = true
  }
}