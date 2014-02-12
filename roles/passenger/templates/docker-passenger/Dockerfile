FROM        benc/baseimage
MAINTAINER  Ben Cochez, ben@cochezconsult.be

########
# NODE #
########
# Add node apt repo
RUN         apt-get -y install python-software-properties software-properties-common
RUN         add-apt-repository -y ppa:chris-lea/node.js
RUN         apt-get -y update

# Install node
RUN         apt-get install -y nodejs

#############
# PASSENGER #
#############
# Add Phusion official apt source to the sources list
RUN         apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
RUN         echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger precise main' | tee /etc/apt/sources.list.d/10gen.list
RUN         apt-get -y install apt-transport-https
RUN         apt-get -y update

# Install Passenger
RUN         apt-get -y install nginx-full passenger
RUN         apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy config files
ADD         nginx.conf /etc/nginx/nginx.conf

# Create mountpoint directory
VOLUME      ["/www"]

# Expose to the world
EXPOSE      80
ADD         supervisord.conf /etc/supervisor/conf.d/nginx.conf
CMD         ["/usr/bin/supervisord", "-n"]
