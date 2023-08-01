#!/bin/bash
#Variables
date=$(date '+%Y-%m-%d %H:%M:%S')
export ETCDCTL_API=3

etcdctl  --data-dir /var/lib/etcd-from-backup snapshot restore /opt/snapshot-pre-boot.db

vi /etc/kubernetes/manifests/etcd.yaml
#Go to the volumes section and update the etcd db file path   volumes:
  #- hostPath:
   #   path: /var/lib/etcd-from-backup
    #  type: DirectoryOrCreate
    #name: etcd-data
