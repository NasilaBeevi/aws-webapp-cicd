#!/bin/bash

set -e

echo "Starting deployment..."

cd ~/aws-webapp-cicd

echo "Pulling latest code..."
git pull origin main

echo "Building Docker image..."
docker build -t aws-webapp .

echo "Stopping old container..."
docker stop aws-webapp-container 2>/dev/null || true

echo "Removing old container..."
docker rm aws-webapp-container 2>/dev/null || true

echo "Starting new container..."
docker run -d \
  --name aws-webapp-container \
  -p 8080:80 \
  --restart unless-stopped \
  aws-webapp

echo "Deployment completed."

docker ps
