#!/usr/bin/env bash

# Step 1: This is your Docker ID/path
dockerpath=phongmx/hello:0.0.1

# Step 2: Run the Docker Hub container with kubernetes
kubectl run hello_app --image=phongmx/hello:0.0.1 --port=80

# Step 3: # List kubernetes pods
kubectl get pods

# Step 4: Forward the container port to a host
kubectl port-forward hello_app 8000:80
