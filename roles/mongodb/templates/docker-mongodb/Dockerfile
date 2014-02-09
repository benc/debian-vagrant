FROM        benc/baseimage
MAINTAINER  Ben Cochez, ben@cochezconsult.be

# Add 10gen official apt source to the sources list
RUN         apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN         echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Install MongoDB
RUN         apt-get -y update
RUN         apt-get -y install mongodb-10gen
RUN         apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configuration
ADD         mongod.conf /etc/mongod.conf

# Create mountpoint directory
VOLUME      ["/data"]

# Expose to the world
EXPOSE      27017
ADD         supervisord.conf /etc/supervisor/conf.d/mongod.conf
CMD         ["/usr/bin/supervisord", "-n"]
