FROM        benc/passenger
MAINTAINER  Ben Cochez, ben@cochezconsult.be

# Nginx
# =====

# Add webapp configuration to nginx
ADD         www.cochez.io.conf /etc/nginx/conf.d/www.cochez.io.conf

# Serf
# ====
ADD         start_serf.sh /usr/local/bin/start_serf.sh
RUN         chmod +x /usr/local/bin/start_serf.sh

ADD         serf_join.sh /usr/local/bin/serf_join.sh
RUN         chmod +x /usr/local/bin/serf_join.sh

ADD         supervisord.conf /etc/supervisor/conf.d/serf.conf

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
