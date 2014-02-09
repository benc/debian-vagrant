FROM        benc/baseimage
MAINTAINER  Ben Cochez, ben@cochezconsult.be

###########
# INSTALL #
###########
# Add apt repo
RUN         apt-get -y install python-software-properties software-properties-common wget
RUN         wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN         echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN         apt-get -y update

# prevent apt from starting postgres right after the installation
RUN         echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d
RUN         LC_ALL=en_US.UTF-8 DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql-9.3 postgresql-contrib-9.3 

#############
# CONFIGURE #
#############
# TODO harden
RUN         su - postgres createuser -P -d -r -s docker
RUN         su - postgres createdb -O docker docker
ADD         postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
ADD         pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf

# Create mountpoint directory
VOLUME      ["/data"]

# Expose to the world
EXPOSE      5432
ADD         supervisord.conf /etc/supervisor/conf.d/postgres.conf
CMD         ["/usr/bin/supervisord", "-n"]
