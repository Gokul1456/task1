#!/bin/bash
yum update -y

# Install Docker
amazon-linux-extras install docker -y || yum install docker -y

# Start Docker
systemctl start docker
systemctl enable docker

# Add ec2-user to docker group
usermod -aG docker ec2-user

# Login to Docker Hub (PUBLIC IMAGE – no login needed)
docker pull yourdockerhubusername/webapp:latest

# Run Docker container
docker run -d \
  --name webapp \
  -p 80:80 \
  gokul1114/myapp:latest

