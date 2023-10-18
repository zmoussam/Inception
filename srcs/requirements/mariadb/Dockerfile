FROM debian:buster

RUN apt update -y && apt-get upgrade -y\
    &&  apt install -y mariadb-server\ 
    &&  sed --in-place "s|^bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY  ./tools/create-db.sh .

RUN chmod +x create-db.sh

EXPOSE 3306

CMD ["bash","./create-db.sh"]
