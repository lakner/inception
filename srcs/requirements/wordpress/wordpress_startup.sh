#! /usr/bin/env /bin/bash
mkdir -p /wordpress/slakner.42.fr && chown -R www-data:www-data /wordpress 
cd /wordpress/slakner.42.fr

wget https://wordpress.org/latest.zip 
unzip latest.zip -d /wordpress/slakner.42.fr
chown -R www-data:www-data /wordpress
sudo -u www-data wp core download --path=/wordpress/slakner.42.fr
sudo -u www-data wp config create --dbhost=mariadb --dbname=wp --dbuser=root --dbpass="foobar23" --allow-root --skip-check

sudo -u www-data wp db create --allow-root --path=/wordpress/slakner.42.fr
sudo -u www-data wp core install --url=slakner.42.fr --title="slakner.42.fr" --admin_user=wpcli --admin-pass=foobar23 --admin_email=admin@slakner.42.fr 
#php wp --info
tail -f