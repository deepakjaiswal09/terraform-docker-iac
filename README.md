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
  image = docker_image.nginx.image_id 
  ports {
    internal = 80
    external = 8000
  }
}

```
## ▶️ Execution Steps
1. Initialize Terraform
```bash
terraform init
```
 <img width="1920" height="1080" alt="Screenshot (1001)" src="https://github.com/user-attachments/assets/afb988d4-c47d-4404-a8a6-a04c382256a0" />

## 2. Preview
Execution Plan
```bash
terraform plan
```
<img width="1920" height="1080" alt="Screenshot (1002)" src="https://github.com/user-attachments/assets/7442a52b-61a6-46a1-9489-f31f70e7c23d" />
<img width="1920" height="1080" alt="Screenshot (1003)" src="https://github.com/user-attachments/assets/394d0f18-363b-43c6-a4b2-6e0158e89299" />


## 3. Apply the Configuration
```bash
terraform apply -auto-approve
```
<img width="1920" height="1080" alt="Screenshot (1004)" src="https://github.com/user-attachments/assets/e0ab400d-c924-4067-9f2a-962495e45873" />

✅ The Nginx container will run on http://localhost:8000

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/3c1bddbd-d6de-4f6d-bd03-0730df0f1378" />


## 4. Verify Container
```bash
docker ps
```
<img width="1920" height="1080" alt="Screenshot (1008)" src="https://github.com/user-attachments/assets/ad8568cd-6ffd-4227-afe9-7d5388406635" />

<img width="1920" height="1080" alt="Screenshot (1009)" src="https://github.com/user-attachments/assets/aaed6973-3dcf-471d-9cd7-f8cda8b62561" />

## 5. Destroy Infrastructure
```bash
terraform destroy -auto-approve
```
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ee0a1fa8-2d54-49aa-8e90-4a9e7632e6b0" />

## 6. View Terraform State
```bash
terraform state list
```
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/aca3ed3f-33a3-4a8f-a286-9c176ef3bdbf" />


# 💡 Key Learnings

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
