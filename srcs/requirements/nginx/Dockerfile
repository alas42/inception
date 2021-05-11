FROM debian:buster

# dl things
RUN apt-get -y install wget nginx

# move files
COPY /srcs/nginx_config /etc/nginx/sites-available/localhost

# scripts and commands
RUN rm -f /etc/nginx/sites-enabled/default && rm -f /var/www/html/index.nginx-debian.html
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# TSL v1.2 or v1.3
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.pem -keyout /etc/ssl/certs/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42/CN=avogt"

# rights of folder
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

# maybe not
CMD ["bash", "./start.sh"]
