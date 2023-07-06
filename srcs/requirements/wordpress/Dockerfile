FROM debian:stable
RUN mkdir -p /var/www && chown -R www-data:www-data /var/www

RUN apt update \
	&& apt install -y wget sudo unzip php-fpm default-mysql-client php-mysql \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


# # RUN sudo -u www-data wp db create --allow-root
# # RUN sudo -u www-data wp core install --url slakner.42.fr --title="slakner.42.fr" --admin_user=wpcli --admin-pass=foobar23 --admin_email=admin@slakner.42.fr 

COPY wordpress_startup.sh /wordpress_startup.sh
RUN chmod +x /wordpress_startup.sh
#CMD ["php", "wp-cli.phar", "--info"]
CMD ["/wordpress_startup.sh"]