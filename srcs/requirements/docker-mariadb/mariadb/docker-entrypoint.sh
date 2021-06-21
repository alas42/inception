#!/bin/sh
set -eo pipefail

if [ -z "$(ls -A /var/lib/mysql/ 2> /dev/null)" ]; then
	touch /tmp/init
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> /tmp/init

	INSTALL_OPTS="--user=mysql"
	INSTALL_OPTS="${INSTALL_OPTS} --auth-root-authentication-method=normal"
	INSTALL_OPTS="${INSTALL_OPTS} --skip-test-db  --datadir=/var/lib/mysql"
	eval /usr/bin/mysql_install_db "${INSTALL_OPTS}"

	echo "create user '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}'; " >> /tmp/init
	echo "CREATE DATABASE ${MYSQL_DATABASE} CHARACTER SET ${MYSQL_CHARSET} COLLATE ${MYSQL_COLLATION};" >> /tmp/init
	echo "grant all on ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}'; " >> /tmp/init
	echo "flush privileges;" >> /tmp/init
	MYSQL_CMD="mysql"
	mysqld --user=mysql > /dev/null 2>&1 &
	PID="$!"
	sleep 1
	echo "init: updating system tables"
	eval "${MYSQL_CMD}" < /tmp/init
	eval mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /tmp/wordpress.sql
	rm -f /tmp/init
	kill -s TERM "${PID}"
fi
rm -f /tmp/wordpress.sql
chown -R mysql:mysql /var/lib/mysql
exec /usr/bin/mysqld --user=mysql --debug-gdb --default_authentication_plugin=mysql_native_password