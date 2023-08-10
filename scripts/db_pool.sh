#!/bin/bash
echo "Creating db scheduler..."
kubectl apply -f db-scheduler.yaml
echo "Creating db secret..."
kubectl create secret generic db-secret --from-literal=DB_Host=sql01 --from-literal=DB_User=root --from-literal=DB_Password=sdefhgeksbknfla;dklsnugb==
echo "Creating db pod..."
kubectl apply -f db-pod.yaml
echo "Creating db service..."
kubectl apply -f db-service.yaml
echo "DB instance is created!" >> /var/www/messages/kube.log
