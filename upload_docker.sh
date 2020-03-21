#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=jygogo/project-ml-microservice-kubernetes

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username=jygogo
docker tag makeprediction $dockerpath:make_prediction_v2

# Step 3:
# Push image to a docker repository
docker push $dockerpath:make_prediction_v2
