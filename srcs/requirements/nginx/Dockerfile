# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zmoussam <zmoussam@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/20 13:01:31 by zmoussam          #+#    #+#              #
#    Updated: 2023/10/20 13:01:37 by zmoussam         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl

RUN apt-get install openssl -y && apt-get clean
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=MA/ST=Grand Casablanca/L=Casablanca/O=42/OU=42/CN=localhost/UID=zmoussam"

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html 

RUN mkdir -p /etc/nginx/conf.d

COPY ./conf/default.conf   /etc/nginx/sites-available/default

EXPOSE 443

# run the master process nginx
ENTRYPOINT [ "nginx", "-g", "daemon off;" ] 