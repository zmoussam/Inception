FROM debian:bullseye

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# RUN service mysql start

# RUN mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# RUN mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_USER_PASSWORD}';"

# RUN mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"

# RUN mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# RUN mysql -e "FLUSH PRIVILEGES;"

# RUN mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

COPY ./tools/create_user_db.sh /create_user_db.sh

RUN chmod +x /create_user_db.sh

ENTRYPOINT ["/create_user_db.sh", "mysqld_safe"]



