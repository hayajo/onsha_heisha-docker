FROM centos

RUN yum install -y httpd
ADD ./index.html /var/www/html/
EXPOSE 80
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

RUN yum install -y openssh-server
RUN /usr/bin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
RUN useradd -m -s /bin/bash docker
RUN echo "docker:docker" | chpasswd
RUN echo "root:root" | chpasswd

EXPOSE 22

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

CMD ["/usr/local/bin/run"]
