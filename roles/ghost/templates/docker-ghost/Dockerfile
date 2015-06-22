FROM        benc/passenger
MAINTAINER  Ben Cochez, ben@cochez.consulting

# Nginx
# =====

# Add webapp configuration to nginx
ADD         heavyindustries.io.conf /etc/nginx/conf.d/heavyindustries.io.conf

# Postgres native client
# ======================
# Add apt repo
RUN         apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN         echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN         apt-get update

# Install postgres library
RUN         apt-get install build-essential libpq-dev postgresql-client-common postgresql-client-9.4

# Ghost
# =====
# Add files & unzip
RUN         mkdir -p /www
ADD         Ghost-0.6.4.zip /www/ghost.zip
RUN         cd /www && unzip -ou ghost.zip && rm -f ghost.zip

# Configure
ADD         config.js /www/config.js

# Install dependencies
RUN         cd /www && npm cache clear && npm install --production --unsafe-perm && npm install pg

# Transfer authority to www-data
RUN         chown -R www-data:www-data /www
