# Description: Dockerfile to build a Wordpress image
# Dockerfile version: 0.1-SNAPSHOT

FROM debian:bullseye

# Set the environment variable DEBIAN_FRONTEND to noninteractive to suppress any interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
# Update the package repository and upgrade the system
RUN apt-get update -y && apt-get upgrade -y \
    && apt install -y php-mysql          \
                    php-fpm              \
                    wget

# Download the Wordpress installer
RUN cd /tmp && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv /tmp/wp-cli.phar /usr/local/bin/

# Change the owner of the wordpress installer
RUN chmod +x /usr/local/bin/wp-cli.phar

# Create folders for Php-fpm
RUN mkdir -p /run/php
RUN touch /var/log/php7.4-fpm.log

COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/wp-installer.sh /tmp/wp_install/wp-installer.sh

# Set the default command to run when a container starts
CMD ["bash", "/tmp/wp_install/wp-installer.sh"]