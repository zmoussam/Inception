# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zmoussam <zmoussam@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/20 13:00:54 by zmoussam          #+#    #+#              #
#    Updated: 2023/10/20 17:01:53 by zmoussam         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


FROM debian:buster

RUN apt update -y && apt-get upgrade -y &&  apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld \
   && chown -R mysql:mysql /run/mysqld \
   && chmod 777 /run/mysqld
   
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY  ./tools/create-db.sh .

RUN chmod +x create-db.sh

EXPOSE 3306

ENTRYPOINT ["bash","./create-db.sh"]
