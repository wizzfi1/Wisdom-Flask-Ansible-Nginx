# 🧠 Wisdom Flask App 🚀

A lightweight Flask web application containerized with Docker, auto-built via GitHub Actions, and deployed to an AWS EC2 instance through secure SSH-based CI/CD.

---

## 🌍 Live Demo

> 🚀 View it live at:  
**http://51.21.196.52:5000**


---

## 📦 Features

- ✅ Python Flask web app
- ✅ Dockerized using `python:3.9-slim`
- ✅ CI/CD with GitHub Actions
- ✅ Auto-deployment to AWS EC2 over SSH
- ✅ Public URL using EC2 Security Group + port 5000
- ✅ Clean repo with Docker + GitHub workflows

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

🧱 Project Structure

wisdom-flask/
├── app.py
├── Dockerfile
├── requirements.txt
├── README.md
├── .dockerignore
└── .github/
    └── workflows/
        └── deploy-to-ec2.yml


📸 Screenshot

![Flask App Screenshot](./screenshot.PNG)
