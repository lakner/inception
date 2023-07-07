#! /usr/bin/env /bin/bash
mkdir -p /wordpress/slakner.42.fr && chown -R www-data:www-data /wordpress 
cd /wordpress/slakner.42.fr

# wget https://wordpress.org/latest.zip
# echo "---Unzipping archive---"
# unzip latest.zip -d /wordpress/slakner.42.fr
chown -R www-data:www-data /wordpress
if ! sudo -u www-data wp core is-installed --path=/wordpress/slakner.42.fr; then
	echo "---Downloading wordpress---"
	sudo -u www-data wp core download --path=/wordpress/slakner.42.fr
	sudo -u www-data wp config create --dbhost=mariadb --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --allow-root --force #--skip-check
	echo "---Installing wordpress---"
	sudo -u www-data wp core install --url==slakner.42.fr --title=slakner --admin_user=root --admin_password=root
else
	echo "---Wordpress already installed, skipping installation---"
fi
#sudo -u www-data wp db create --allow-root --path=/wordpress/slakner.42.fr --dbuser=${DB_USER} --dbpass=${DB_PASS}
sudo -u www-data wp core install --url=slakner.42.fr --title="slakner.42.fr" --admin_user=wpcli --admin-pass=foobar23 --admin_email=admin@slakner.42.fr 
#php wp --info
tail -f