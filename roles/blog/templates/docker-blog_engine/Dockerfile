FROM        benc/passenger
MAINTAINER  Ben Cochez, ben@cochezconsult.be

# Install node pg dependencies
RUN         apt-get -y install libpq-dev

# Add webapp configuration to nginx
ADD         www.cochezconsult.be.conf /etc/nginx/conf.d/www.cochezconsult.be.conf
