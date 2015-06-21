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
ADD         ghost-0.4.1.zip /www/ghost.zip
RUN         cd /www && unzip -ou ghost.zip && rm -f ghost.zip

ADD         N-Coded.zip /www/content/themes/N-Coded.zip
RUN         cd /www/content/themes/ && unzip -ou N-Coded.zip && rm -f N-Coded.zip

ADD         Uno-master.zip /www/content/themes/Uno-master.zip
RUN         cd /www/content/themes/ && unzip -ou Uno-master.zip && rm -f Uno-master.zip

ADD         Vapor-master.zip /www/content/themes/Vapor-master.zip
RUN         cd /www/content/themes/ && unzip -ou Vapor-master.zip && rm -f Vapor-master.zip

ADD         ghostium-master.zip /www/content/themes/ghostium-master.zip
RUN         cd /www/content/themes/ && unzip -ou ghostium-master.zip && rm -f ghostium-master.zip

ADD         solar-theme-ghost-master.zip /www/content/themes/solar-theme-ghost-master.zip
RUN         cd /www/content/themes/ && unzip -ou solar-theme-ghost-master.zip && rm -f solar-theme-ghost-master.zip

# Configure
ADD         config.js /www/config.js

# Install dependencies
RUN         cd /www && npm cache clear && npm install --production && npm install pg

# Transfer authority to www-data
RUN         chown -R www-data:www-data /www
