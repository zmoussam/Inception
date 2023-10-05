FROM debian:buster

RUN apt update 

RUN apt upgrade -y

RUN apt-get install wget -y

RUN apt-get install -y php7.3 php-mysql php-fpm mariadb-client 

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz



RUN	chown -R root:root /var/www/wordpress

    