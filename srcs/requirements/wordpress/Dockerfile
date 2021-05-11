FROM debian:buster

# dl things
RUN apt-get -y install php7.3 php-mysql php-fpm php-cli php-mbstring
RUN wget -c https://wordpress.org/latest.tar.gz

# move files
RUN tar -xvzf latest.tar.gz
RUN mv wordpress /var/www/html/
RUN rm latest.tar.gz
COPY /srcs/wordpress_config.php /var/www/html/wordpress/wp-config.php
COPY /srcs/wp_db.sh /

# scripts and commands
RUN sh wp_db.sh
