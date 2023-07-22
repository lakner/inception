#! /usr/bin/env /bin/bash
mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html 
cd /var/www/html

if ! sudo -u www-data wp core is-installed --path=/var/www/html; then
	echo "---Downloading wordpress---"
	sudo -u www-data wp core download --path=/var/www/html
	sudo -u www-data wp config create --dbhost=mariadb --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --allow-root --force
	echo "---Installing wordpress---"
	sudo -u www-data wp core install --url==${WP_URL} --title=slakner --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=admin@slakner.42.fr
	echo "define( 'HTTP_HOST', 'nginx' );" >> /var/www/html/wp-config.php
	echo "define( 'WP_SITEURL', 'https://${WP_URL}' );" >> /var/www/html/wp-config.php
	echo "define( 'WP_HOME', 'https://${WP_URL}' );" >> /var/www/html/wp-config.php
	echo "define( 'CONCATENATE_SCRIPTS', false );" >> /var/www/html/wp-config.php
	echo "define( 'SCRIPT_DEBUG', true );" >> /var/www/html/wp-config.php
else
	echo "---Wordpress already installed, skipping installation---"
fi
exec /usr/sbin/php-fpm8.2 -F --allow-to-run-as-root
