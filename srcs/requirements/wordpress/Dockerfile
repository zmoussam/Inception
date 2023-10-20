# dockerfile for wordpress installation 

# base image 
FROM debian:bullseye

# maintainer
RUN apt update && apt upgrade -y \
    && apt-get install -y php7.4 php7.4-curl php7.4-mysql php7.4-fpm curl 

RUN mkdir -p /run/php

RUN mkdir -p /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

COPY ./tools/wp-install.sh /wp-install.sh

RUN chmod +x /wp-install.sh

EXPOSE 9000

ENTRYPOINT ["/wp-install.sh", "php-fpm7.4", "-F"]

