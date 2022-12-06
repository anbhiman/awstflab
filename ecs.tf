resource "aws_ecs_cluster" "appecscluster" {
  name = "acslab-${var.app_environment}-cluster"
  tags = {
    Name        = "dev-ecs"
    Environment = var.app_environment
  }
}
