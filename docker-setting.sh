#!/bin/bash

echo "도커 설치"
sudo apt update
sudo apt-get install -y ca-certificates \ 
    curl \
    software-properties-common \
    apt-transport-https \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo chmod a+r /etc/apt/keyrings/docker/gpg
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker --version

echo "Docker ingress 에 필요한 포트 개방"
sudo ufw allow 2377/tcp
sudo ufw allow 7946/tcp
sudo ufw allow 4789/udp

echo "/etc/docker/daemon.json 파일 설정"
touch /etc/docker/daemon.json
echo "{\n\t\"insecure-registries\": [\"manager url:4000\"]\n\t}" >> /etc/docker/daemon.json