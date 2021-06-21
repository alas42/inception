#!/usr/bin/env sh
set -euo pipefail

if [ -z "$(ls -A /var/www/html/ 2> /dev/null)" ]; then
	wget http://wordpress.org/wordpress-5.6.tar.gz
	tar -xzvf wordpress-5.6.tar.gz
	rm wordpress-5.6.tar.gz
	cp -rf /var/www/html/wordpress/* /var/www/html
	rm -rf /var/www/html/wordpress
	cp -f /tmp/wp-config.php /var/www/html
fi

cp -f /tmp/wp-config.php /var/www/html
chown -R www-a42:www-a42 /var/www/html
chmod -R 774 /var/www/html
chmod 660 /var/www/html/wp-config.php

exec "$@"