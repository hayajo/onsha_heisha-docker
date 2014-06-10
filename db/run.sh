#!/bin/sh

/usr/sbin/sshd

/usr/bin/mysqld_safe &

sleep 3

echo 'CREATE DATABASE IF NOT EXISTS wordpress' | mysql -u root;
echo 'GRANT ALL PRIVILEGES ON wordpress.* TO wordpress@"%" IDENTIFIED BY "wordpress" WITH GRANT OPTION;' | mysql -u root

tail -F /var/log/mysqld.log
