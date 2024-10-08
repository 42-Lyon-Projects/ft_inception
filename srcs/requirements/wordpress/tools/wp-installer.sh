#!/bin/bash
sleep 5;

if [ ! -f /var/www/jbadaire.42.fr/wp-config.php ]; then

	wp-cli.phar core download --allow-root --path=/var/www/jbadaire.42.fr


	wp-cli.phar config create --allow-root --dbname="${DATABASE_NAME}" \
	                          --dbuser="${DATABASE_USER}" \
	                          --dbpass="${DATABASE_USER_PASSWORD}" \
	                          --dbhost=inception-mariadb \
	                          --path=/var/www/jbadaire.42.fr

	wp-cli.phar core install --allow-root --url="jbadaire.42.fr" \
	                         --title="Inception jbadaire" \
	                         --admin_user="${WP_SU_USERNAME}" \
	                         --admin_email="${WP_SU_EMAIL}" \
	                         --admin_password="${WP_SU_PASSWORD}" \
	                         --path=/var/www/jbadaire.42.fr

	wp-cli.phar user create --allow-root "${WP_DEFAULT_USER}" "${WP_DEFAULT_USER_EMAIL}" \
	                        --user_pass="${WP_DEFAULT_USER_PASSWORD}" \
	                        --role=editor \
	                        --path=/var/www/jbadaire.42.fr
fi

mkdir -p /run/php
php-fpm7.4 -F