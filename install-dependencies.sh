#!/bin/bash

sudo apt update
sudo apt install curl -y

# Install Docker
curl https://get.docker.com | sudo bash
sudo usermod -aG docker jenkins

# Install Docker Compose
sudo apt install -y curl jq
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo $DOCKER_PASSWORD | docker login --username jasminedhaliwal95 --stdin-password
