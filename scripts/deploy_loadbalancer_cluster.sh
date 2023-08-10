#!/bin/bash

#Creating the new cluster
minikube start --cpus=2 --memory=2gb --disk-size=10gb

kubectl create deployment balanced --image=kicbase/echo-server:1.0
kubectl expose deployment balanced --type=LoadBalancer --port=8080
