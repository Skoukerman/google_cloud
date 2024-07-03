#!/bin/bash

# Change to the micro-buy-bot directory
cd ~/micro-buy-bot || { echo "Directory ~/micro-buy-bot not found."; exit 1; }

# Pull the latest changes from the Git repository
echo "Pulling latest changes from Git repository..."
git pull || { echo "Failed to pull from Git repository."; exit 1; }

# Build the Docker image
echo "Building Docker image..."
docker build . -t micro-pump-tg:latest || { echo "Docker build failed."; exit 1; }

# Bring down Docker Compose services
echo "Bringing down Docker Compose services..."
docker compose down || { echo "Failed to bring down Docker Compose services."; exit 1; }

# Bring up Docker Compose services in detached mode
echo "Bringing up Docker Compose services..."
docker compose up -d || { echo "Failed to bring up Docker Compose services."; exit 1; }

echo "Script completed successfully."