#! /usr/bin/env /bin/bash
mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html 
cd /var/www/html

if ! sudo -u www-data wp core is-installed --path=/var/www/html; then
	echo "---Downloading wordpress---"
	sudo -u www-data wp core download --path=/var/www/html
	sudo -u www-data wp config create --dbhost=mariadb --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --allow-root --force
	echo "---Installing wordpress---"
	sudo -u www-data wp core install --url==${WP_URL} --title=slakner --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=admin@slakner.42.fr
	sudo -u www-data wp config set HTTP_HOST 'nginx'
	sudo -u www-data wp config set WP_SITEURL "https://${WP_URL}"
	sudo -u www-data wp config set WP_HOME "https://${WP_URL}"
	sudo -u www-data wp config set CONCATENATE_SCRIPTS false
	sudo -u www-data wp config set SCRIPT_DEBUG true
else
	echo "---Wordpress already installed, skipping installation---"
fi
exec /usr/sbin/php-fpm8.2 -F --allow-to-run-as-root
