region     = "us-west-2"
access_key = "aws access_key"
secret_key = "aws scret key"

image_uri               = "image uri"
cluster_name            = "tf-cluster"
task_definition_name    = "tf-task-definition"
container_port          = 40177
service_name            = "tf-service"
service_security_groups = ["sg-0ee3d77d06ec2d014"]
service_subnets         = ["subnet-0141ff5c", "subnet-d96da493", "subnet-68a99f43", "subnet-f1a50a89"]

target_group       = "tf-target-group"
vpc_id             = "vpc-ec613394"
load_blanacer_name = "tf-lb"

lb_security_groups = ["sg-023b38dc2bc7e2be9", "sg-651ccc40"]
lb_subnets         = ["subnet-0141ff5c", "subnet-68a99f43", "subnet-d96da493", "subnet-f1a50a89"]