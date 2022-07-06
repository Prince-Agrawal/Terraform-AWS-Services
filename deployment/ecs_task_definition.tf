resource "aws_ecs_task_definition" "first_task_defination_tf" {
  family                   = var.task_definition_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "arn:aws:iam::740011792935:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::740011792935:role/ecsTaskExecutionRole"
  container_definitions = jsonencode([
    {
      name  = "sample"
      image = var.image_uri
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ],
      environment = [
        {
          name  = "APP_SERVER_URI",
          value = "https://app-dev.joinsatoshi.com/"
        }
      ],
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-group         = aws_cloudwatch_log_group.tf-log-group.name,
          awslogs-region        = var.region,
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  runtime_platform {
    operating_system_family = "LINUX"
  }
}

resource "aws_cloudwatch_log_group" "tf-log-group" {
  name = "/ecs/${var.task_definition_name}"
}