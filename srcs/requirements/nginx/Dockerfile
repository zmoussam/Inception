FROM debian:buster

RUN apt update

RUN apt upgrade -y

RUN mkdir -p /var/run/nginx

RUN apt install -y nginx

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y 

RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Casablanca/O=42/OU=42/CN=zmoussam.42.fr/UID=zmoussam"

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf   /etc/nginx/nginx.conf

EXPOSE 443

# run the master process nginx
CMD [ "nginx", "-g", "daemon off;" ] 