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

resource "aws_ecs_task_definition" "test" {
  family                   = "${var.app_name}-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "iis",
    "image": "mcr.microsoft.com/windows/servercore/iis",
    "cpu": 1024,
    "memory": 2048,
    "essential": true
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "WINDOWS_SERVER_2019_CORE"
    cpu_architecture        = "X86_64"
  }
  
}
