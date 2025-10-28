#!/bin/bash
sudo dnf update -y

# 1. Add the official Docker repository
sudo dnf install -y dnf-utils
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 2. Install Docker CE (Community Edition)
sudo dnf install -y docker-ce docker-ce-cli containerd.io

# 3. Start and enable the Docker service
sudo systemctl start docker
sudo systemctl enable docker

# 4. Add ec2-user to the docker group
# This is correct, RHEL AMIs also use 'ec2-user'
sudo usermod -aG docker ec2-user

# 5. Install docker-compose (your commands are correct)
sudo curl -SL "https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
