
FROM alpine:3.21
#официальный образ alpine, нам нельзя использовать лэйтест
#penultimate - второй с конца!

RUN apk update && apk add --no-cache nginx openssl
#openssl может понадобиться для генерации сертификатов или для утилит управления TLS

RUN mkdir -p /run/nginx /var/www/html /etc/nginx/ssl
# /run/nginx нужно Nginx для PID-файла
# /var/www/html — корневая папка сайта (WordPress туда кладёт свои файлы).

COPY ./conf/default.conf /etc/nginx/http.d/default.conf
#копируем наш конфиг nginx в контейнер
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# копируем entrypoint
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 443
#говорим докеру, что контейнер слушает порт 443

CMD ["/entrypoint.sh"]
