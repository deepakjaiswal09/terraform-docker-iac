# 🚀 Terraform Docker IaC Demo

This project demonstrates **Infrastructure as Code (IaC)** using **Terraform** to provision a local **Docker container**.  
The task provisions an **Nginx container**, verifies it, and then destroys it — showcasing the complete lifecycle of infrastructure automation.

---

## 📌 Objective
- Use Terraform to manage infrastructure as code.
- Provision a Docker container locally.
- Understand Terraform workflow (`init`, `plan`, `apply`, `destroy`).
- Explore Terraform state management.

---

## 🛠️ Tools Used
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Docker](https://docs.docker.com/get-docker/)

---

## 📂 Project Structure
```bash
├── main.tf # Terraform configuration file
├── README.md # Documentation
```
## ⚙️ Terraform Configuration (`main.tf`)

```hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

# Create nginx container
resource "docker_container" "nginx" {
  name  = "terraform-nginx"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }
}

```
##▶️ Execution Steps
1. Initialize Terraform
```bash
terraform init
```

##2. Preview Execution Plan
```bash
terraform plan
```

##3. Apply the Configuration
```bash
terraform apply -auto-approve
```
✅ The Nginx container will run on http://localhost:8000

##4. Verify Container
```bash
docker ps
```

##5. View Terraform State
```bash
terraform state list
```

##6. Destroy Infrastructure
```bash
terraform destroy -auto-approve
```

#💡 Key Learnings

- IaC enables reproducible and automated infrastructure provisioning.

- Terraform Providers allow integration with multiple platforms (here we used Docker).

- State file keeps track of real-world resources.

- Clear workflow: init → plan → apply → destroy.

## 🙏 Acknowledgements

This project was completed as part of my **DevOps Internship – Day 3 Task**.  
The task focused on using **Terraform** with **Docker** to provision infrastructure as code (IaC).  

I would like to thank my internship coordinators and mentors for designing such practical tasks that helped me gain real-world exposure to DevOps practices.  

Special thanks to the open-source community and official documentation for guidance:
- [Terraform by HashiCorp](https://developer.hashicorp.com/terraform/docs)
- [Docker Documentation](https://docs.docker.com/)
