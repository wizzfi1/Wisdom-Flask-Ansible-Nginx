# 🧠 Wisdom Flask · GitHub → Docker Hub → AWS EC2 🚀

A lightweight Flask web application containerized with Docker, auto-built via GitHub Actions, and deployed to an AWS EC2 instance through secure SSH-based CI/CD.

---

This project demonstrates a complete DevOps deployment pipeline:

- ✅ Python Flask web application
- ✅ Dockerized with a lightweight, production-ready image
- ✅ GitHub Actions workflow that automates deployment
- ✅ Secure SSH-based delivery to AWS EC2 on every push
- ✅ Publicly accessible at: http://51.21.196.52:5000

> 🛠️ CI/CD without clickops. Just code → deploy.

---

### 🔗 Live Project Links

- 🧠 **Live App**: http://51.21.196.52:5000  
- 📦 **Docker Image**: [Docker Hub Repo](https://hub.docker.com/r/<yourdockerhub>/wisdom-flask)  
- 🧰 **Deployed via**: [GitHub Actions Workflow](.github/workflows/deploy-to-ec2.yml)

---

### 💡 What This Proves

- You understand CI/CD workflows **beyond tutorials**
- You can securely automate production-like infrastructure
- You’re capable of cloud deployment with industry tools

---


## 🐳 Run Locally

### Clone the repo:

git clone https://github.com/wizzfi1/wisdom-flask.git
cd wisdom-flask

Build and run:

docker build -t wisdom-flask .
docker run -p 5000:5000 wisdom-flask
Then open http://localhost:5000

🔁 CI/CD: GitHub Actions → AWS EC2
This project uses GitHub Actions to deploy automatically to an EC2 instance on every push to main.

🔐 Secrets Used:
EC2_HOST → your EC2 public IP

EC2_SSH_KEY → your private SSH key (added via GitHub Secrets)

💻 Workflow File:

.github/workflows/deploy-to-ec2.yml
What it does:
Connects to EC2 using SSH

Pulls the latest Docker image from Docker Hub

Stops and replaces the running container


## 📸 Screenshot

![Flask App Screenshot](./screenshot.PNG)


## 🧱 Project Structure

```text
wisdom-flask/
├── app.py
├── Dockerfile
├── requirements.txt
├── README.md
├── .dockerignore
└── .github/
    └── workflows/
        └── deploy-to-ec2.yml


💡 DevOps Stack Used

| Category         | Tool               |
| ---------------- | ------------------ |
| Language         | Python (Flask)     |
| Containerization | Docker             |
| CI/CD            | GitHub Actions     |
| Cloud Hosting    | AWS EC2 (Ubuntu)   |
| Deployment       | Docker Run via SSH |


⭐ Don't forget to star the repo if this helped you!
