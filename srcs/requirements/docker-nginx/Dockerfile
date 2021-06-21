FROM alpine:3.13

LABEL maintainer="NGINX Custom <avogt@student.42.fr>"

# Download openssl for certs generation and nginx
RUN apk --update add nginx \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /run/nginx \
	&& mkdir -p /var/www/html \
	&& mkdir -p /etc/nginx/ssl \
	&& rm -f /etc/nginx/conf.d/default.conf \
	&& rm -f /etc/nginx/nginx.conf

COPY nginx/nginx.conf /etc/nginx/

COPY nginx/avogt.42.fr.crt /etc/nginx/ssl/

COPY nginx/avogt.42.fr.key /etc/nginx/ssl/

RUN set -eux; \
	addgroup -g 1003 -S www-a42; \
	adduser -u 1003 -D -S -G www-a42 www-a42; \
	chown -R www-a42:www-a42 /etc/nginx/ssl; \
	chmod 622 /etc/nginx/ssl/avogt.42.fr.crt; \
	chmod 600 /etc/nginx/ssl/avogt.42.fr.key

WORKDIR /var/www/html

#That line does nothing. It is just a reminder
EXPOSE 443

#Starts nginx process in foreground
CMD ["nginx", "-g", "daemon off;"]