
FROM alpine:3.18

RUN apk update && apk add --no-cache \
    php82 php82-fpm php82-mysqli php82-json php82-opcache php82-session php82-mbstring php82-phar mariadb-client curl
#устанавливаем php-fpm и необходимые расширения для работы wordpress

# Устанавливаем лимит памяти PHP
RUN echo "memory_limit=512M" >> /etc/php82/php.ini
RUN ln -s /usr/bin/php82 /usr/bin/php
RUN mkdir -p /run/php /var/www/html
#создаем папку для хранения runtime файлов php-fpm

COPY ./conf/php-fpm.conf /etc/php82/php-fpm.d/www.conf
COPY ./tools/install-wp.sh /usr/local/bin/install-wp.sh
RUN chmod +x /usr/local/bin/install-wp.sh

EXPOSE 9000
#говорим докеру, что контейнер слушает порт 9000

CMD ["/usr/local/bin/install-wp.sh"]
#CMD ["php-fpm82", "-F"]
# запускаем php-fpm в фореграунд режиме (иначе контейнер сразу завершится)
