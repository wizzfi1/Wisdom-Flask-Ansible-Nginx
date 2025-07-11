# 🚀 Wisdom Flask Ansible

A fully automated Flask application deployment pipeline built with **Terraform**, **Ansible**, **Docker**, and **GitHub Actions**.

This project provisions AWS infrastructure, configures EC2, and deploys a Dockerized Flask app — all triggered by a single `git push`.

---

## 📦 Tech Stack

- **AWS EC2** – compute environment for app hosting  
- **Terraform** – infrastructure provisioning (IaaC)  
- **Ansible** – remote configuration and Docker deployment  
- **Docker** – containerized Flask application  
- **GitHub Actions** – CI/CD automation  
- **Docker Hub** – image storage & delivery  

---

## 🧱 Architecture

```text
┌──────────────┐       ┌──────────────┐       ┌────────────────────┐
│  GitHub Repo │ ───▶  │ GitHub Actions │ ───▶ │ Terraform (infra/) │
└──────────────┘       └──────────────┘       └────────┬──────────┘
                                                       ▼
                                               ┌──────────────┐
                                               │   AWS EC2    │
                                               │ Ubuntu + SG  │
                                               └──────┬───────┘
                                                      ▼
                                               ┌──────────────┐
                                               │  Ansible CI  │
                                               │ Installs Docker
                                               │ Runs Flask App │
                                               └──────┬───────┘
                                                      ▼
                                               ┌──────────────┐
                                               │ Docker Hub   │
                                               │ wizfi/wisdom │
                                               └──────────────┘


📁 Folder Structure

Wisdom-Flask-Ansible/
├── ansible/
│   ├── site.yml              # Ansible playbook
│   └── inventory.ini         # Dynamic inventory from GitHub Action
├── infra/
│   ├── main.tf               # Terraform AWS EC2 & keypair setup
│   ├── github-deploy.pub     # Public key used for SSH
├── .github/
│   └── workflows/
│       └── deploy.yml        # GitHub Actions CI/CD workflow
├── .gitignore
├── README.md                 # You're here!


💡 How It Works
-Push to main branch

-GitHub Actions runs deploy.yml

-Terraform provisions:

EC2 instance

Security group (ports 22, 5000)

Injects SSH key

Action extracts EC2 public IP

-Ansible connects via SSH:

Installs Docker

Pulls Flask image from Docker Hub

Runs container on port 5000

🌍 Live App

🔗 http://52.55.169.248:5000

🧪 Local Testing (Optional)
You can test everything locally before pushing:

# Infra
cd infra
terraform init
terraform apply

# Deploy
cd ansible
ansible-playbook -i inventory.ini site.yml

🔐 GitHub Secrets Required

| Secret Name             | Description                                   |
| ----------------------- | --------------------------------------------- |
| `AWS_ACCESS_KEY_ID`     | IAM access key for AWS                        |
| `AWS_SECRET_ACCESS_KEY` | IAM secret key for AWS                        |
| `SSH_PRIVATE_KEY`       | EC2 private key (from `~/.ssh/github-deploy`) |
| `EC2_SSH_USER`          | Typically `ubuntu`                            |
| `DOCKERHUB_USERNAME`    | Docker Hub login                              |
| `DOCKERHUB_TOKEN`       | Docker Hub access token                       |


## 🏁 Next Steps (Planned)

- [ ] Add **NGINX** reverse proxy  
- [ ] Enable **HTTPS** with Let's Encrypt  
- [ ] Connect **custom domain**  
- [ ] Add monitoring with **Prometheus + Grafana**  
- [ ] Move to **Kubernetes / ECS**


🙌 Contributions
This project is a learning showcase — contributions and forks are welcome!
Feel free to star 🌟 the repo if you found it helpful.
