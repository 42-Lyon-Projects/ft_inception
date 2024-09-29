# Description: Dockerfile to build a nginx Server image
# Dockerfile version: 0.1-SNAPSHOT

FROM debian:bullseye

# Set the environment variable DEBIAN_FRONTEND to noninteractive to suppress any interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update the package repository and upgrade the system
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y openssl \
    && apt-get install -y nginx

# Create a nginx required directories
RUN mkdir -p /var/www/jbadaire.42.fr && mkdir -p /etc/nginx/ssl && mkdir -p /etc/nginx/conf.d && mkdir -p /var/lib/nginx/

RUN mkdir -p /home/nginx #&& chown -R nginx:nginx /home/nginx


# Generate a self-signed certificate
RUN openssl req -x509 -nodes -days 365 -keyout /etc/nginx/ssl/jbadaire.42.fr.key -out /etc/nginx/ssl/jbadaire.42.fr.crt -subj "/C=FR/ST=Paris/L=Lyon/O=42/OU=42/CN=jbadaire.42.fr/UID=jbadaire"

COPY ./conf/jbadaire.42.fr.conf /etc/nginx/conf.d/config.conf

# Set the default command to run when a container starts
CMD ["nginx", "-g", "daemon off;"]