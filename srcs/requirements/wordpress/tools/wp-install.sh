#!/bin/bash

## change directory to /var/www/html where we will install wordpress
# where the volume is mounted
cd /var/www/html/;

## download wordpress source code
# source code will be downloaded to /var/www/html/wordpress folder
# > dev/null to hide the output of curl command (progress bar)
# -O to write output to a file 
curl -O https://wordpress.org/latest.tar.gz > /dev/null;

## download wp-cli to manage wordpress from command line 
# source code will be downloaded to /var/www/html/wp-cli.phar
# -O to write output to a file
# > dev/null to hide the output of curl command, it a good practice
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null;

## make wp-cli.phar executable
# 
chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

tar -xvf latest.tar.gz;

rm latest.tar.gz;

mv wordpress/* .;

rm -rf wordpress;

touch /var/www/html/wp-config.php;

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php;

sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.conf;

sed -i 's/database_name_here/'$SQL_DATABASE'/g' /var/www/html/wp-config.php;

sed -i 's/username_here/'$SQL_USER'/g' /var/www/html/wp-config.php;

sed -i 's/password_here/'$SQL_USER_PASSWORD'/g' /var/www/html/wp-config.php;

sed -i 's/localhost/'$WORDPRESS_DB_HOST'/g' /var/www/html/wp-config.php;

wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role='author' --allow-root

exec "$@";
