#!/usr/bin/env bash

# Step 1: Build image and add a descriptive tag
docker build -t hello_app -f ./app/Dockerfile .

# Step 2: # List docker images
docker image ls

# Step 3: Run flask app
docker run --name capstone -p 8000:80 hello_app
