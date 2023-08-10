#!/bin/bash
export ETCDCTL_API=3
kubectl config get-clusters
kubectl config use-context cluster1
echo "Checking etcd location"
kubectl get pods -n kube-system | grep etcd
echo "Getting the external etcd server IP"
ps -ef | grep etcd-servers
echo "Getting the etcd folder"
kubectl -n kube-system describe pod etcd-cluster1-controlplane | grep data-dir

kubectl describe  pods -n kube-system etcd-cluster1-controlplane  | grep advertise-client-urls
kubectl describe  pods -n kube-system etcd-cluster1-controlplane  | grep pki

 etcdctl --endpoints=https://10.1.220.8:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key snapshot save /opt/cluster1.db
  
