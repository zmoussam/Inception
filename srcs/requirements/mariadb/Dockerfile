
FROM debian:buster

RUN apt update -y && apt-get upgrade -y &&  apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY  ./tools/create-db.sh .

RUN chmod +x create-db.sh

EXPOSE 3306

ENTRYPOINT ["bash","./create-db.sh"]
