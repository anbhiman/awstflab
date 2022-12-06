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

resource "aws_ecs_task_definition" "awsecstaskdefinition" {
  family                = "test"
  container_definitions = <<TASK_DEFINITION
[
  {
    "cpu": 10,
    "command": ["sleep", "10"],
    "entryPoint": ["/"],
    "environment": [
      {"name": "VARNAME", "value": "VARVAL"}
    ],
    "essential": true,
    "image": "jenkins",
    "memory": 128,
    "name": "jenkins",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 8080
      }
    ],
        "resourceRequirements":[
            {
                "type":"InferenceAccelerator",
                "value":"device_1"
            }
        ]
  }
]
TASK_DEFINITION

  inference_accelerator {
    device_name = "device_1"
    device_type = "eia1.medium"
  }
}
