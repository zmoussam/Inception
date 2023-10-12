#!/bin/bash

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;

# chmod +x wp-cli.phar;

# mv wp-cli.phar /usr/local/bin/wp;

cd /var/www/html/;

# wp core download --allow-root;

touch /var/www/html/wp-config.php;
curl -O https://wordpress.org/latest.tar.gz > /dev/null;

tar -xvf latest.tar.gz;

rm latest.tar.gz;
mv wordpress/* .;
rm -rf wordpress;


cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php;

sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.conf;

sed -i 's/database_name_here/'$SQL_DATABASE'/g' /var/www/html/wp-config.php;

sed -i 's/username_here/'$SQL_USER'/g' /var/www/html/wp-config.php;

sed -i 's/password_here/'$SQL_USER_PASSWORD'/g' /var/www/html/wp-config.php;

sed -i 's/localhost/'$WORDPRESS_DB_HOST'/g' /var/www/html/wp-config.php;

# wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

# wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role='author' --allow-root

exec "$@";
