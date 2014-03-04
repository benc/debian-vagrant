FROM        benc/baseimage
MAINTAINER  Ben Cochez, ben@cochezconsult.be

# Installation is already performed in the baseimage
ADD         run_etcd.sh /usr/local/bin/run_etcd.sh
RUN         chmod +x /usr/local/bin/run_etcd.sh
ADD         supervisord.conf /etc/supervisor/conf.d/etcd.conf

EXPOSE      4001
EXPOSE      7001
