FROM        debian:jessie
MAINTAINER  Ben Cochez, ben@cochez.consulting

# Base Docker image
# =================

# Upgrade Ubuntu LTS
# ------------------
ENV         DEBIAN_FRONTEND noninteractive
ENV         INITRD No

RUN         echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90forceyes
RUN         apt-get update

# Fix some issues with APT packages.
# See https://github.com/dotcloud/docker/issues/1024
# RUN         dpkg-divert --local --rename --add /sbin/initctl
# RUN         ln -sf /bin/true /sbin/initctl

# Upgrade all packages
RUN         echo "initscripts hold" | dpkg --set-selections
RUN         apt-get upgrade --no-install-recommends

# Configure NTP
# -------------
RUN         apt-get install ntp
ADD         ntp.conf /etc/ntp.conf

# Utilities
# ---------
RUN         apt-get install curl unzip

# Editor
# ------
# vim
RUN         apt-get install vim

# OpenSSH
# -------
RUN         adduser --disabled-password --gecos "" {{ docker.user }}
RUN         usermod -a -G sudo docker -p {{ docker.password }}

RUN         mkdir -p /home/docker/.ssh

RUN         apt-get install openssh-server
RUN         mkdir -p /var/run/sshd

# Secure the ssh installation
RUN         sed -i -e "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
RUN         sed -i -e "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

ADD         authorized_keys /home/docker/.ssh/
RUN         chown -R docker:docker /home/docker/.ssh && chmod 0700 /home/docker/.ssh && chmod 0600 /home/docker/.ssh/*

# Supervisor
# ----------
RUN         apt-get install supervisor
RUN         mkdir -p /var/log/supervisor

# create directory for child images to store configuration in
RUN         mkdir -p /etc/supervisor/conf.d

# Finish
# ======
EXPOSE      22
ADD         supervisord.conf /etc/supervisord.conf
CMD         ["/usr/bin/supervisord", "-n"]
