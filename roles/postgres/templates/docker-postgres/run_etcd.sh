#!/usr/bin/env bash
export IP=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
exec etcd -addr "$IP:4001" -peer-addr "$IP:7001" -name postgres -data-dir /etc/etcd/ -discovery {{ etcd_token }}

etcdctl set /postgres/ip $IP
etcdctl set /postgres/db $POSTGRES_DB
etcdctl set /postgres/user $POSTGRES_USER
etcdctl set /postgres/password $POSTGRES_PASSWORD
