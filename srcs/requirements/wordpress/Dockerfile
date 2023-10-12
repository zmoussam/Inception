FROM debian:bullseye

RUN apt update 

RUN apt upgrade -y

RUN apt-get install -y php php-curl php-mysql php-fpm curl 

RUN mkdir -p /run/php

RUN mkdir -p /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

COPY ./tools/wp-install.sh /wp-install.sh

RUN chmod +x /wp-install.sh

ENTRYPOINT ["/wp-install.sh", "php-fpm7.4", "-F"]

