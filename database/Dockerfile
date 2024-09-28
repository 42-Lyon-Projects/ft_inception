# Description: Dockerfile to build a MySQL Server image
# Dockerfile version: 0.1-SNAPSHOT

FROM debian:bullseye

# Set the environment variable DEBIAN_FRONTEND to noninteractive to suppress any interactive prompts
ARG DEBIAN_FRONTEND=noninteractive

#Create a user and group first so the UID and GID are consistent
RUN groupadd -r mysql && useradd -r -g mysql mysql --home-dir /var/lib/mysql

# Update the package repository and upgrade the system. Install the MySQL Server
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y mariadb-server

#Expose the MySQL port to the host for some tests
EXPOSE 3306

#RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf

# Create a volume for the MySQL data
#VOLUME /var/lib/mysql

# Create a database and user
RUN service mariadb start && mariadb -u root                                                      \
    -e "CREATE DATABASE IF NOT EXISTS wordpress_db;"                                              \
    -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_USER_PASSWORD}';"  \
    -e "GRANT ALL PRIVILEGES ON *.* TO '${DATABASE_USER}'@'%';"                                   \
    -e "FLUSH PRIVILEGES;"

# Set the user and group to run the MySQL Server
USER mysql:mysql

# Set the default command to run when a container starts
CMD ["mariadbd", "--bind-address=0.0.0.0"]