#!/bin/bash
#Variables
date=$(date '+%Y-%m-%d %H:%M:%S')

echo "The IP to reach ETCD cluster:"
kubectl describe pod etcd-controlplane  -n kube-system | grep '\--listen-client-urls'
kubectl -n kube-system describe pod etcd-controlplane | grep '\--trusted-ca-file'
kubectl -n kube-system describe pod etcd-controlplane | grep '\--cert-file'

export ETCDCTL_API=3

echo "Creating backup..."
etcdctl --endpoints=https://[127.0.0.1]:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
snapshot save /opt/snapshot-pre-boot.db
