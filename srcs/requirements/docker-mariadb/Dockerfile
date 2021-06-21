FROM alpine:3.13

LABEL maintainer="Mariadb Custom <avogt@student.42.fr>"

RUN apk --update add \
	mariadb \
	mariadb-client \
	mariadb-server-utils \
	&& rm -rf /var/cache/apk/*

RUN set -eux; \
	mkdir -p /var/lib/mysql; \
	chown -R mysql:mysql /var/lib/mysql; \
	chmod 764 /var/lib/mysql; \
	rm -f /etc/my.cnf.d/mariadb-server.cnf

COPY mariadb/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
COPY mariadb/my.cnf /etc/my.cnf.d/
COPY mariadb/wordpress.sql /tmp/

RUN chmod +x /usr/bin/docker-entrypoint.sh \
	&& touch /var/log/mysqld.log \
	&& chown -R mysql:mysql /var/log/ \ 
	&& chmod -R 644 /var/log/ \
	&& mkdir /run/mysqld \
	&& chown mysql:mysql /etc/my.cnf.d/ /run/mysqld

#That line does nothing. It is just a reminder
EXPOSE 3306

#Launch the script (Creation of db wordpress and filling it with wordpress.sql provided)
ENTRYPOINT ["docker-entrypoint.sh"]
