#!/bin/bash
export ETCDCTL_API=3
etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/etcd/pki/ca.pem --cert=/etc/etcd/pki/etcd.pem --key=/etc/etcd/pki/etcd-key.pem snapshot restore /root/cluster2.db --data-dir /var/lib/etcd-data-new

#Changing data dir to the new one on the /etc/systemd/system/etcd.service
#[Unit]
#Description=etcd key-value store
#Documentation=https://github.com/etcd-io/etcd
#After=network.target

#[Service]
#User=etcd
#Type=notify
#ExecStart=/usr/local/bin/etcd \
#  --name etcd-server \
#  --data-dir=/var/lib/etcd-data-new \
#---End of Snippet---

chown -R etcd:etcd /var/lib/etcd-data-new
systemctl daemon-reload 
systemctl restart etcd
