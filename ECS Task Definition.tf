resource "aws_ecs_task_definition" "my_app" {
  family                   = "my-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "my-app"
      image     = "my-docker-image"
      memory    = 512
      cpu       = 256
      essential = true
    }
  ])
}
