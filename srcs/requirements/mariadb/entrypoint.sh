#!/bin/sh
set -e

# initialize database if empty
if [ ! -d /var/lib/mysql/mysql ]; then
    echo "Initializing MariaDB..."
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

# start MariaDB in background
mysqld_safe --datadir=/var/lib/mysql &

# wait until server is ready
sleep 5

# run init script only on first run
if [ -f /etc/mysql/init.sql ]; then
    echo "Running init.sql..."
    mysql < /etc/mysql/init.sql
    rm /etc/mysql/init.sql
fi

# bring server to foreground
wait
