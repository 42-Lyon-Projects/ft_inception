# Description: Dockerfile to build a nginx Server image
# Dockerfile version: 0.1-SNAPSHOT

FROM debian:bullseye

# Set the environment variable DEBIAN_FRONTEND to noninteractive to suppress any interactive prompts
ARG DEBIAN_FRONTEND=noninteractive

#Create a user and group first so the UID and GID are consistent
#RUN groupadd -r nginx && useradd -r -g nginx nginx

# Update the package repository and upgrade the system
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y openssl \
    && apt-get install -y nginx

# Create a nginx required directories
RUN mkdir -p /var/www/jbadaire.42.fr && mkdir -p /etc/nginx/ssl && mkdir -p /etc/nginx/conf.d && mkdir -p /var/lib/nginx/

# Change the owner of the nginx directories
#RUN chown nginx:nginx /etc/nginx/ -R && chown nginx:nginx /var/www/jbadaire.42.fr/ -R \
#    && chown nginx:nginx /var/lib/nginx/ -R && chown nginx:nginx /var/log/nginx/ -R \
#    && chown nginx:nginx /run/ -R

RUN mkdir -p /home/nginx #&& chown -R nginx:nginx /home/nginx

# Set the user and group to run the nginx Server
#USER nginx

# Generate a self-signed certificate
RUN openssl req -x509 -nodes -days 365 -keyout /etc/nginx/ssl/jbadaire.42.fr.key -out /etc/nginx/ssl/jbadaire.42.fr.crt -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=jbadaire/CN=jbadaire.42.fr/UID=nginx"

#Expose the nginx port to the host for some tests
#EXPOSE 80

# Create a volume for the nginx data
#VOLUME /var/www/jbadaire.42.fr

COPY ./conf/ssl.conf /etc/nginx/snippets/ssl.conf
COPY ./conf/jbadaire.42.fr.conf /etc/nginx/conf.d/config.conf

# Set the default command to run when a container starts
CMD ["nginx", "-g", "daemon off;"]