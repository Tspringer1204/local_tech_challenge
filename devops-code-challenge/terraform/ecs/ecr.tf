resource "aws_ecr_repository" "frontend_repo" {
  name                 = "frontend-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "Frontend Repository"
  }
}

resource "aws_ecr_repository" "backend_repo" {
  name                 = "backend-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "Backend Repository"
  }
}

