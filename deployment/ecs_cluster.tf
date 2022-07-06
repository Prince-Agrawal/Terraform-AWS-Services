
resource "aws_ecs_cluster" "first_tf_cluster" {
  name = var.cluster_name
}