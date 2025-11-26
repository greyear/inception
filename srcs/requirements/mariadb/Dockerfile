FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir -p /run/mysqld /var/lib/mysql \
 && chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY ./conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./conf/init.sql /docker-entrypoint-initdb.d/init.sql
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 3306
ENTRYPOINT ["/entrypoint.sh"]
