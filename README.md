[![CircleCI](https://circleci.com/gh/jygogo/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/jygogo/project-ml-microservice-kubernetes)

## Project Overview

In this project you will operationalize a machine learning microservice using kubernetes, which is an open-source system for automating the management of containerized applications. In this project you will:

Test the project code using linting
Complete a Dockerfile to containerize this application
Deploy a containerized application using Docker and make a prediction
Improve the log statements in the source code for this application
Configure Kubernetes and create a Kubernetes cluster
Deploy a container using Kubernetes and make a prediction
Upload a complete Github repo with CircleCI to indicate that the code has been tested

## Setup the Environment

You will need to create a Virtual machine using vmware workstation and install Ubuntu LTS server (Ubuntu Server 18.04.4 LTS). The ISO image can be downloaded from (https://ubuntu.com/download/server) 

* Create a virtualenv and activate it

```bash
python3 -m venv ~/.devops
source ~/.devops/bin/activate
```

* Run `make install` to install the necessary dependencies

```bash
make install
```

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally

1. wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_19.03.8~3-0~ubuntu-bionic_amd64.de
2. wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/containerd.io_1.2.6-3_amd64.deb
3. wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_19.03.8~3-0~ubuntu-bionic_amd64.deb
4. sudo dpkg -i /tmp/docker-ce-cli_19.03.8~3-0~ubuntu-bionic_amd64.deb
5. sudo dpkg -i /tmp/containerd.io_1.2.6-3_amd64.deb
6. sudo dpkg -i /tmp/docker-ce_19.03.8~3-0~ubuntu-bionic_amd64.deb

* Setup and Configure Kubernetes locally

1. sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
2. sudo chmod +x minikube
3. sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
4. sudo chmod +x ./kubectl
5. sudo mv ./kubectl /usr/local/bin/kubectl

* Create Flask app in Container

1. minikube start
2. ./run_kubernetes.sh

* Run via kubectl

kubectl run makeprediction --image=docker.io/$dockerpath:make_prediction_v3 --port=8000

### Description of the files

The following files are in the github repository (https://github.com/jygogo/project-ml-microservice-kubernetes.git)

1. .circleci : circle CI directory
2. model_data: Data from Kaggle for machine learning Microservice
3. output_txt_files : log output files when calling the machine learning microservice while running the appliation on docker and   kubernetes
4. Dockerfile: Docker image build instructions
5. Makefile: project make file
6. README.md: Information about the project
7. app.py: Microservice application
8. make_prediction.sh: Shell script to call the machine learning API
9. requirements.txt: Project dependencies file
10. run_docker.sh: To build and run docker image locally
11. run_kubernetes.sh: To deploy and run the machine learning application on kubernetes cluster
12. upload_docker.sh: To upload the docker image to docker hub
