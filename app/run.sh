#!/bin/bash

/usr/sbin/sshd

perl -i -ple "s|^(\\s*add_action\\('template_redirect', 'redirect_canonical'\\);\\s*)\$|//\$1|" /var/www/html/wp-includes/canonical.php

DB_HOST=$DB_PORT_3306_TCP_ADDR LB_PORT=8080 perl -i -ple 's|\{\{\s*(.+?)\s*}}|$ENV{$1}|ge' /var/www/html//wp-config.php

/usr/sbin/httpd

tail -F /var/log/httpd/access_log
