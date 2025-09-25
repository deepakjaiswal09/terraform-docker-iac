terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    #   version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}
# Create container
resource "docker_container" "nginx" {
  name  = "terraform-nginx"
  image = docker_image.nginx.image_id   # ✅ correct attribute
  ports {
    internal = 80
    external = 8000
  }
}
