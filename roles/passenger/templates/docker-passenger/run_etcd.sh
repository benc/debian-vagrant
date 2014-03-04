#!/usr/bin/env bash
export IP=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
exec etcd -addr "$IP:4001" -peer-addr "$IP:7001" -name passenger -data-dir /etc/etcd/ -discovery {{ etcd.token }}
