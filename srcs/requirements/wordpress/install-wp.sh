#!/bin/sh

cd /var/www/html || exit 1

# Ждём MariaDB
echo "Waiting for database..."
until mysqladmin ping -h mariadb -u wpuser -ppassword >/dev/null 2>&1; do
  sleep 2
done
echo "Database is up!"


# Если WordPress уже скачан, пропускаем скачивание
if [ ! -f wp-config.php ]; then
    # Скачиваем WP-CLI
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar

    # Скачиваем WordPress
    ./wp-cli.phar core download --allow-root

    # Создаём wp-config.php
    ./wp-cli.phar config create \
        --dbname=wordpress \
        --dbuser=wpuser \
        --dbpass=password \
        --dbhost=mariadb \
        --allow-root

    # Устанавливаем WordPress
    ./wp-cli.phar core install \
        --url=localhost \
        --title=inception \
        --admin_user=admin \
        --admin_password=admin \
        --admin_email=admin@admin.com \
        --allow-root
fi

# Запускаем php-fpm в фореграунд режиме
php-fpm82 -F
