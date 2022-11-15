## Project Overview
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/phongmx2021/phongmx05/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/phongmx2021/phongmx05/tree/master)

In this project we will apply the skills and knowledge which were developed that include:

- Working in AWS
- Using Circle CI to implement Continuous Integration and Continuous Deployment
Building pipelines
- Using CloudFormation to deploy clusters
- Building Kubernetes clusters
- Building Docker containers in pipelines

As a capstone project, the directions are rather more open-ended than they were in the previous projects in the program. We will also be able to make some of your own choices in this capstone, for the type of deployment you implement, which services you will use, and the nature of the application you develop.

We will develop a CI/CD pipeline for micro services applications with either blue/green deployment or rolling deployment. You will also develop your Continuous Integration steps as you see fit, but must at least include typographical checking (aka "linting"). To make your project stand out, you may also choose to implement other checks such as security scanning, performance testing, integration testing, etc.!

## Project steps
1. Build and publish docker image to Docker hub
2. Setup Kubernetes cluster
3. Setup CircleCI pipeline

### Build and publish Docker image
    $ python3 -m venv ~/.hello_app
    $ source ~/.hello_app/bin/activate
    $ cd app
    $ make install
    $ make lint
    
    $ docker login -u $DOCKER_ID -p $DOCKER_PASSWORD
    $ docker build -t hello_application -f ./app/Dockerfile .
    $ docker tag hello_application phongmx/hello:${VERSION}
    $ docker tag hello_application phongmx/hello:latest
    $ docker push phongmx/hello:${VERSION}
    $ docker push phongmx/hello:latest

### Setup Kubernetes cluster
- Create cluster
        
        eksctl create cluster -f template/cluster.yaml
        install aws cli and gettext-base
        install aws-iam-authenticator
        update kubeconfig to eks cluster
        aws eks --region $AWS_DEFAULT_REGION update-kubeconfig --name $CLUSTER_NAME
        kubectl config current-context

- Deploy deployments & services
        
        $ envsubst < kubernetes/green/deployment.yaml | kubectl apply --filename -
        $ envsubst < kubernetes/green/service.yaml | kubectl apply --filename -

- Check deployments, services, nodes & pods
        
        $ kubectl get all
        $ kubectl get nodes

### Setup CircleCI pipeline
- Config environment variables
![](screenshots/environment-variables.png)

- Directory structure
  1. The `.circleci` folder includes a `config.yml` file that is pipeline configuration file for CircleCI
  2. The `app` folder contains source code (Python) to build and push Docker image
  3. The `kubernetes` folder contains code of deploy deployments and service to EKS cluster
  4. The `screenshots` folder contains steps during implement capstone project
  5. The `template` folder contains template of EKS cluster
