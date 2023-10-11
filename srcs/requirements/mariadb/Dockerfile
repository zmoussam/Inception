FROM debian:bullseye

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld 

RUN chown -R mysql:mysql /var/run/mysqld

RUN chmod 777 /var/run/mysqld 

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/create_user_db.sh /create_user_db.sh

RUN chmod +x /create_user_db.sh

EXPOSE 3306

ENTRYPOINT ["/create_user_db.sh", "mysqld_safe"]
