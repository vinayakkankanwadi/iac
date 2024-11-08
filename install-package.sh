#!/bin/bash

# Update package list
sudo apt-get update

# Install prerequisites
sudo apt-get install -y cloud-utils apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key and set up the repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker’s official repository to APT sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again after adding Docker repository
sudo apt-get update

# Install Docker CE
sudo apt-get install -y docker-ce

# Add the current user (ubuntu) to the docker group
sudo usermod -aG docker ubuntu

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify installations
docker --version
docker-compose --version

echo "Docker and Docker Compose installation complete."
