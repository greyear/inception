
FROM alpine:3.21

RUN apk update && apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx /var/www/html /etc/nginx/ssl

COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 443

CMD ["/entrypoint.sh"]
