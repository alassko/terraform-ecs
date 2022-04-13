provider "aws"  {

    region     = "us-east-1"

    access_key = "variable"

    secret_key = "variable"

}

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  name = "my-ecs"

  container_insights = true

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy = [
    {
      capacity_provider = "FARGATE_SPOT"
    }
  ]

  tags = {
    Environment = "Development"
  }
}
