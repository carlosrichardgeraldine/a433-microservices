#!/bin/bash

# Script to build and push Docker image for Karsa Jobs UI frontend

# Variables
GITHUB_USERNAME="carlosrichardgeraldine"
IMAGE_NAME="karsajobs"
TAG="latest"

echo "Building Docker image: ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG"
# Build the Docker image from Dockerfile
docker build -t ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG .

echo "Logging in to GitHub Container Registry"
# Login to GitHub Container Registry (requires a Personal Access Token)
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

echo "Pushing image to GitHub Container Registry: ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG"
# Push the image to GitHub Container Registry
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG

echo "Process completed!"