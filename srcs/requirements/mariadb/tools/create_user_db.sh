#!/bin/bash

sed --in-place "s|^socket|#socket|g" /etc/mysql/my.cnf
sed --in-place "s|^# port|port|g" /etc/mysql/my.cnf

echo "[mysqld]" >> /etc/mysql/my.cnf
echo "user = mysql" >> /etc/mysql/my.cnf
echo "port = 3306" >> /etc/mysql/my.cnf
echo "datadir = /var/lib/mysql" >> /etc/mysql/my.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
echo "wait_timeout = 3600" >> /etc/mysql/my.cnf

sed --in-place "s|^bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe;

while ! mysqladmin ping -h localhost --silent 2>/dev/null; do
 	sleep 1
done

expect -c "

set timeout 1
spawn mysql_secure_installation

expect \"Enter current password for root (enter for none): \"
send \"$MYSQL_ROOT_PASSWORD\r\"
expect \"Switch to unix_socket authentication \[Y/n\] \"
send \"y\r\"
expect \"Change the root password? \[Y/n\] \"
send \"n\r\"
expect \"Remove anonymous users? \[Y/n\] \"
send \"y\r\"
expect \"Disallow root login remotely? \[Y/n\] \"
send \"y\r\"
expect \"Remove test database and access to it? \[Y/n\] \"
send \"y\r\"
expect \"Reload privilege tables now? \[Y/n\] \"
send \"y\r\"
expect eof
"

# mysqladmin -u root password "$MARIADB_ROOT_PASSWORD"

cat << _EOF_ > /tmp/db.sql
CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
FLUSH PRIVILEGES;
_EOF_

mariadb -u root -p"$MYSQL_ROOT_PASSWORD" < /tmp/db.sql

mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

exec mysqld