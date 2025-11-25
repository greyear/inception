
FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client bash

RUN mkdir -p /run/mysqld /var/lib/mysql \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql
#создаем папки для хранения runtime файлов mariadb и меняем владельца на mysql

USER mysql

COPY ./conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./conf/init.sql /etc/mysql/init.sql

EXPOSE 3306

CMD ["mysqld", "--init-file=/etc/mysql/init.sql"]
