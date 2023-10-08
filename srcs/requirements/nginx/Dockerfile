FROM debian:buster

RUN apt update -y

RUN apt upgrade -y

RUN mkdir -p /var/run/nginx

RUN apt install -y nginx

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y 

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
CMD [ "nginx", "-g", "daemon off;" ] 