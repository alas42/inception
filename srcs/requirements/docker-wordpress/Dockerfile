FROM alpine:3.13

LABEL maintainer="Wordpress - && php-fpm - Custom <avogt@student.42.fr>"

# Download php-fpm, php and recommanded extensions for a wordpress site
RUN apk --update add \
        php7 \
        php7-bcmath \
        php7-dom \
        php7-ctype \
        php7-curl \
        php7-fileinfo \
        php7-fpm \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
		php7-mysqli \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-phar \
        php7-posix \
        php7-simplexml \
        php7-session \
        php7-soap \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip \
    && rm -rf /var/cache/apk/*


COPY wordpress/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

#Create a new user with same name and uid as the one in Makefile
RUN set -eux; \
	addgroup -g 1003 -S www-a42; \
	adduser -u 1003 -D -S -G www-a42 www-a42; \
	mkdir -p /etc/php7/conf.d; \
	[ ! -d /var/www/html ] && \
	mkdir -p /var/www/html; \
	chown www-a42:www-a42 /var/www/html; \
	chmod 764 /var/www/html; \
	rm -f /etc/php7/php-fpm.d/www.conf; \
	chmod +x /usr/bin/docker-entrypoint.sh;

WORKDIR /var/www/html

#That line does nothing. It is just a reminder
EXPOSE 9000

COPY wordpress/php-fpm.conf /etc/php7/php-fpm.d/
COPY wordpress/wp-config.php /tmp/

#Launch script (download wordpress if not existing)
ENTRYPOINT ["docker-entrypoint.sh"]
#Launch at the end of the script the php-fpm process in foreground
CMD ["php-fpm7", "-F"]