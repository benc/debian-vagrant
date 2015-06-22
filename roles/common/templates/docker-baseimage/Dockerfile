FROM        debian:jessie
MAINTAINER  Ben Cochez, ben@cochez.consulting

# Base Docker image
# =================

# Upgrade
# -------
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
