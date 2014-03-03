FROM        benc/baseimage
MAINTAINER  Ben Cochez, ben@cochezconsult.be

# Installation is already performed in the baseimage
ADD         start_serf.sh /usr/local/bin/start_serf.sh
RUN         chmod +x /usr/local/bin/start_serf.sh

ADD         supervisord.conf /etc/supervisor/conf.d/serf.conf

# Expose
EXPOSE 7946 7373
