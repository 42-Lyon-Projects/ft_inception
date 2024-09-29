# Description: Dockerfile to build a MySQL Server image
# Dockerfile version: 0.1-SNAPSHOT

FROM debian:bullseye

# Set the environment variable DEBIAN_FRONTEND to noninteractive to suppress any interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

ARG DATABASE_NAME
ARG DATABASE_USER
ARG DATABASE_USER_PASSWORD
ARG DATABASE_ROOT_PASSWORD

# Update the package repository and upgrade the system. Install the MySQL Server
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y mariadb-server


#RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf

# Create a database and user
RUN service mariadb start && mariadb -u root                                                      \
    -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};"                                              \
    -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_USER_PASSWORD}';"  \
    -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}';"                                   \
    -e "FLUSH PRIVILEGES;"

# Set the user and group to run the MySQL Server
# USER mysql:mysql

# Set the default command to run when a container starts
CMD ["mariadbd", "--bind-address=0.0.0.0"]