FROM        ubuntu:12.04
MAINTAINER  Ben Cochez, ben@cochezconsult.be

######################
# UPGRADE UBUNTU LTS #
######################
ENV         DEBIAN_FRONTEND noninteractive
ENV         INITRD No

RUN         echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise main universe" > echo /etc/apt/sources.list
RUN         echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main universe" >> echo /etc/apt/sources.list
RUN         apt-get -y update

# Fix some issues with APT packages.
# See https://github.com/dotcloud/docker/issues/1024
RUN         dpkg-divert --local --rename --add /sbin/initctl
RUN         ln -sf /bin/true /sbin/initctl

# Upgrade all packages
RUN         echo "initscripts hold" | dpkg --set-selections
RUN         apt-get upgrade -y --no-install-recommends

#######
# NTP #
#######
RUN         apt-get install -y ntp
ADD         ntp.conf /etc/ntp.conf

#############
# UTILITIES #
#############
RUN         apt-get install -y curl unzip

##########
# EDITOR #
##########
# vim
RUN         apt-get install -y vim

# rmate
RUN         curl -Lo /usr/local/bin/rmate https://raw.github.com/aurora/rmate/master/rmate
RUN         chmod a+x /usr/local/bin/rmate

###########
# OPENSSH #
###########
RUN         adduser --disabled-password --gecos "" docker
RUN         echo 'docker:docker' | chpasswd
RUN         usermod -a -G sudo docker

RUN         mkdir -p /home/docker/.ssh

RUN         apt-get install -y openssh-server
RUN         mkdir -p /var/run/sshd

# Secure the ssh installation
RUN         sed -i -e "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
RUN         sed -i -e "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

ADD         authorized_keys /home/docker/.ssh/
RUN         chown -R docker:docker /home/docker/.ssh && chmod 0700 /home/docker/.ssh && chmod 0600 /home/docker/.ssh/*

##############
# SUPERVISOR #
##############
RUN         apt-get install -y supervisor
RUN         mkdir -p /var/log/supervisor

# create directory for child images to store configuration in
RUN         mkdir -p /etc/supervisor/conf.d

# Expose to the world
EXPOSE      22
ADD         supervisord.conf /etc/supervisord.conf
CMD         ["/usr/bin/supervisord", "-n"]
