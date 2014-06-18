FROM centos

RUN useradd -m -s /bin/bash docker
RUN echo "docker:docker" | chpasswd
RUN echo "root:root" | chpasswd
 
RUN yum install -y openssh-server
RUN /usr/bin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''

EXPOSE 22

RUN yum install -y httpd php php-mysql unzip perl
RUN curl -L -o /tmp/wp.zip http://ja.wordpress.org/wordpress-3.9.1-ja.zip
RUN cd /tmp && unzip wp.zip
RUN rm -rf /var/www/html && mv /tmp/wordpress /var/www/html
ADD wp-config.php /var/www/html/
RUN perl -i -ple 's|\{\{\s*SECRET_KEY\s*}}|`curl -s https://api.wordpress.org/secret-key/1.1/salt/`|e' /var/www/html/wp-config.php
RUN perl -i -ple "s|^(\\s*add_action\\('template_redirect', 'redirect_canonical'\\);\\s*)\$|//\$1|" /var/www/html/wp-includes/canonical.php

EXPOSE 80

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

CMD ["/usr/local/bin/run"]
