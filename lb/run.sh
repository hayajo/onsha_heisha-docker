#!/bin/sh

/usr/sbin/sshd

perl -i -pale 's/\{\{\s*(.+?)\s*}}/$ENV{$1}/eg' /etc/nginx/conf.d/default.conf

/usr/sbin/nginx

tail -F /var/log/nginx/access.log
