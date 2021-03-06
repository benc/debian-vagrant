FROM        benc/baseimage
MAINTAINER  Ben Cochez, ben@cochez.consulting

# Install
# =======

# Add apt repo
RUN         apt-get install python-software-properties software-properties-common wget
RUN         wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN         echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN         apt-get update

# prevent apt from starting postgres right after the installation
RUN         echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d

# install
RUN         LC_ALL=en_US.UTF-8 DEBIAN_FRONTEND=noninteractive apt-get install postgresql-9.4 postgresql-contrib-9.4

# Configure
# =========

# /etc/ssl/private can't be accessed from within container for some reason
# (@andrewgodwin says it's something AUFS related)
RUN         mkdir /etc/ssl/private-copy; \
            mv /etc/ssl/private/* /etc/ssl/private-copy/;  \
            rm -r /etc/ssl/private;  \
            mv /etc/ssl/private-copy /etc/ssl/private;  \
            chmod -R 0700 /etc/ssl/private;  \
            chown -R postgres /etc/ssl/private

ADD         postgresql.conf {{ postgres.conf_dir }}/postgresql.conf
RUN         chown -R postgres:postgres {{ postgres.conf_dir }}/postgresql.conf
ADD         pg_hba.conf {{ postgres.conf_dir }}/pg_hba.conf
RUN         chown -R postgres:postgres {{ postgres.conf_dir }}/pg_hba.conf

# Expose to the world
EXPOSE      5432
VOLUME      ["{{ postgres.data_dir }}"]

ADD         start_postgres.sh /usr/local/bin/
RUN         chmod +x /usr/local/bin/start_postgres.sh
ADD         supervisord.conf /etc/supervisor/conf.d/postgres.conf
CMD         ["/usr/bin/supervisord", "-n"]
