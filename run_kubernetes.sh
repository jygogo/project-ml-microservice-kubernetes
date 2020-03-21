#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=jygogo/project-ml-microservice-kubernetes

# Step 2
# Run the Docker Hub container with kubernetes
docker login --username=jygogo
kubectl run makeprediction --image=docker.io/$dockerpath:make_prediction_v3 --port=8000


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/makeprediction 8000:80 
