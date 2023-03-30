#!/bin/bash
#This installation is working on the Docker driver
#Download the latest release
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

#kubectl installation
#Install as root
#sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#Install as non-root user
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
#Checking version
kubectl version --client

#Minikube installation
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
#Checking minikube version
minikube version
#Adding minikube alias to the kubectl
alias kubectl="minikube kubectl --"

#Starting simple cluster
minikube start
kubectl get nodes
