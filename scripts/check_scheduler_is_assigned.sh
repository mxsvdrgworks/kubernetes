#!/bin/bash
kubectl get pods --namespace=kube-system | grep db-custom-scheduler
#Check assigning to a scheduler
kubectl get events -o wide
kubectl logs db-custom-scheduler --namespace=kube-system > /home/ubuntu/k8s_checks/db_scheduler.log
