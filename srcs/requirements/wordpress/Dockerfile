FROM debian:oldstable
RUN mkdir -p /var/www && chown -R www-data:www-data /var/www
RUN apt update \
	&& apt install -y wget sudo unzip \
	fcgiwrap \
	php-fpm \
	php-mysqli php-json php-curl php-dom \
	php-exif php-fileinfo php-mbstring \
	php-xml php-zip php-redis \
	php-cli php-phar \
	default-mysql-client php-mysql \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +rw /var/lib/php/sessions
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY conf/php.ini /etc/php/8.2/fpm/php.ini
COPY wordpress_startup.sh /wordpress_startup.sh
RUN chmod +x /wordpress_startup.sh
CMD ["/wordpress_startup.sh"]