# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zmoussam <zmoussam@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/20 13:01:58 by zmoussam          #+#    #+#              #
#    Updated: 2023/10/20 15:51:16 by zmoussam         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# dockerfile for wordpress installation 

# base image 
FROM debian:bullseye

# maintainer
RUN apt update && apt upgrade -y \
    && apt install -y php7.4 php7.4-curl php7.4-mysql php7.4-fpm curl 

RUN mkdir -p /run/php

RUN mkdir -p /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

COPY ./tools/wp-install.sh /wp-install.sh

RUN chmod +x /wp-install.sh

EXPOSE 9000

ENTRYPOINT ["/wp-install.sh", "php-fpm7.4", "-F"]

