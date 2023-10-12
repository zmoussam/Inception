#!/bin/bash


service mysql start;

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]
then
	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" 
    mysql -u root -e "GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_USER_PASSWORD';"
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
	mysql -u root -e "FLUSH PRIVILEGES;"
fi