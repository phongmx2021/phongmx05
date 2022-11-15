#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Step 1: Create dockerpath
dockerpath=phongmx/hello

# Step 2: Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag $dockerpath $dockerpath

# Step 3: Push image to a docker repository
docker push $dockerpath
