FROM debian:buster

# dl things
RUN apt-get -y install mariadb-server
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz

# move files
RUN tar xzf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
COPY /srcs/phpMyAdmin_config.inc.php /var/www/html/phpmyadmin/config.inc.php