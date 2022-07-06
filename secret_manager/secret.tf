resource "aws_secretsmanager_secret" "secret_tf" {
  name = "test/secrete1"
  description = "This is example description"
}
variable "example" {
  default = {
    key11 = "value1"
    key12 = "value2"
  }

  type = map(string)
}

resource "aws_secretsmanager_secret_version" "secret_tf_version" {
  secret_id     = aws_secretsmanager_secret.secret_tf.id
  secret_string = jsonencode(var.example)
}