FROM        benc/passenger
MAINTAINER  Ben Cochez, ben@cochezconsult.be

# Nginx
# =====

# Add webapp configuration to nginx
ADD         www.cochezconsult.be.conf /etc/nginx/conf.d/www.cochezconsult.be.conf

# Postgres native client
# ======================
# Add apt repo
RUN         apt-get install python-software-properties software-properties-common wget
RUN         wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN         echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN         apt-get update

# Install postgres library
RUN         apt-get install build-essential libpq-dev postgresql-client-common postgresql-client-9.3

# Ghost
# =====
# Add files & unzip
RUN         mkdir -p /www
ADD         ghost-0.4.1.zip /www/ghost.zip
RUN         cd /www && unzip -ou ghost.zip && rm -f ghost.zip

RUN         mkdir -p /www/www/content/themes/n-coded/
ADD         N-Coded.zip /www/content/themes/n-coded/N-Coded.zip
RUN         cd /www/content/themes/n-coded/ && unzip -ou N-Coded.zip && rm -f N-Coded.zip

# Configure
ADD         config.js /www/config.js

# Install dependencies
RUN         cd /www && npm cache clear && npm install --production && npm install pg

# Transfer authority to www-data
RUN         chown -R www-data:www-data /www
