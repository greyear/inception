
FROM alpine:3.18

RUN apk update && apk add --no-cache \
    php82 php82-fpm php82-mysqli php82-json php82-opcache php82-session php82-mbstring
#устанавливаем php-fpm и необходимые расширения для работы wordpress

RUN mkdir -p /run/php
#создаем папку для хранения runtime файлов php-fpm

#COPY ./conf/php-fpm.conf /etc/php8/php-fpm.conf
#копируем наш конфиг php-fpm в контейнер

EXPOSE 9000
#говорим докеру, что контейнер слушает порт 9000

CMD ["php-fpm82", "-F"]
# запускаем php-fpm в фореграунд режиме (иначе контейнер сразу завершится)
