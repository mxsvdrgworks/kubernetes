#!/bin/bash
kubectl create -f ./kube-logging.yaml
kubectl create -f ./elasticsearch_svc.yaml
kubectl create -f ./elasticsearch_statefulset.yaml

kubectl rollout status sts/es-cluster --namespace=cluster-logging-ns > status.log 
kubectl port-forward es-cluster-0 9200:9200 --namespace=cluster-logging-ns
curl http://localhost:9200/_cluster/state?pretty >> status.log 
kubectl create -f ./kibana-svc-deploy.yaml
kubectl rollout status deployment/kibana --namespace=cluster-logging-ns >> status.log
kubectl get pods --namespace=cluster-logging-ns -o name | grep kibana
kubectl port-forward kibana-* 5601:5601 --namespace=cluster-logging-ns
curl http://localhost:5601 >> status.log
kubectl create -f fluent-d-set.yaml
kubectl get ds --namespace=>> status.log
#Optional, testing EFK is working
kubectl create -f optional-test_counter.yaml