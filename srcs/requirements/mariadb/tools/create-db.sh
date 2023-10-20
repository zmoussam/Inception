# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create-db.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zmoussam <zmoussam@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/20 13:00:51 by zmoussam          #+#    #+#              #
#    Updated: 2023/10/20 17:10:09 by zmoussam         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/bash

service mysql start;
# sleep 5;

if [ ! -d "/var/lib/mysql/${SQL_DATABASE}" ]
then

    mysql -u root -e "DROP DATABASE IF EXISTS test;"
    echo "Creating database: ${SQL_DATABASE}"
    
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

    mysql -e "CREATE USER IF NOT EXISTS  \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_USER_PASSWORD}';"

    mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"

    mysql -e "FLUSH PRIVILEGES;"

fi
service mysql stop;
exec mysqld_safe