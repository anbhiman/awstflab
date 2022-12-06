resource "aws_ecs_cluster" "appecscluster" {
  name = "acslab-${var.app_environment}-cluster"
  tags = {
    Name        = "dev-ecs"
    Environment = var.app_environment
  }
}

resource "aws_ecr_repository" "aws-ecr" {
  name = "ecrlab-${var.app_environment}-ecr"
  tags = {
    Name        = "lab-ecr"
    Environment = var.app_environment
  }
}

resource "aws_cloudwatch_log_group" "log-group" {
  name = "${var.app_name}-${var.app_environment}-logs"

  tags = {
    Application = var.app_name
    Environment = var.app_environment
  }
}
