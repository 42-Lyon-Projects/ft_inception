# Description: Dockerfile to build a Wordpress image
# Dockerfile version: 0.1-SNAPSHOT

FROM debian:bullseye

# Set the environment variable DEBIAN_FRONTEND to noninteractive to suppress any interactive prompts
ARG DEBIAN_FRONTEND=noninteractive

#Create a user and group first so the UID and GID are consistent
#RUN groupadd -r nginx && useradd -r -g nginx nginx

# Update the package repository and upgrade the system
RUN apt-get update -y && apt-get upgrade -y \
    && apt install -y php7.4-mysql          \
                    php7.4-fpm              \
                    wget

# Download the Wordpress installer
RUN cd /tmp && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chown nginx:nginx /tmp/wp-cli.phar
#RUN mkdir -p /tmp/wp_install && chown nginx:nginx /tmp/wp_install
#RUN mkdir -p /usr/local/bin/ && chown nginx:nginx /usr/local/bin/
RUN mv /tmp/wp-cli.phar /usr/local/bin/

# Change the owner of the wordpress installer
#RUN chown nginx:nginx /usr/local/bin/wp-cli.phar
RUN chmod +x /usr/local/bin/wp-cli.phar

# Create folders for Php-fpm
RUN mkdir -p /run/php
RUN touch /var/log/php7.4-fpm.log
#RUN chown -R nginx:nginx /run/php
#RUN chown nginx:nginx /var/log/php7.4-fpm.log

# Set the user and group to run the nginx Server
#USER nginx

COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/wp-installer.sh /tmp/wp_install/wp-installer.sh

# Set the default command to run when a container starts
CMD ["bash", "/tmp/wp_install/wp-installer.sh"]