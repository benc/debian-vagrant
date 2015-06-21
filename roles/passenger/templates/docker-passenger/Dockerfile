FROM        benc/baseimage
MAINTAINER  Ben Cochez, ben@cochez.consulting

# Node.js
# =======

# Install node
RUN         apt-get install nodejs npm

# Passenger
# =========

# Add Phusion official apt source to the sources list
RUN         apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
RUN         echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger jessie main' | tee /etc/apt/sources.list.d/passenger.list
RUN         apt-get install apt-transport-https
RUN         apt-get update

# Install Passenger
RUN         apt-get install nginx-full passenger
RUN         apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy config files
ADD         nginx.conf /etc/nginx/nginx.conf

# Expose to the world
EXPOSE      80
ADD         supervisord.conf /etc/supervisor/conf.d/nginx.conf
CMD         ["/usr/bin/supervisord", "-n"]
