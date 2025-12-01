#!/bin/sh
set -e

# Initialize database if empty
if [ ! -d /var/lib/mysql/mysql ]; then
    echo "Initializing MariaDB..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

# Start mysqld in background as mysql user
mysqld --user=mysql --datadir=/var/lib/mysql &
pid="$!"

# Wait until MariaDB is ready
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB..."
    sleep 1
done

# Execute all init scripts once
if ls /docker-entrypoint-initdb.d/*.sql > /dev/null 2>&1; then
    echo "Running init scripts..."
    for f in /docker-entrypoint-initdb.d/*.sql; do
        echo "Running $f..."
        mariadb < "$f"
        rm "$f"
    done
fi

wait "$pid"
