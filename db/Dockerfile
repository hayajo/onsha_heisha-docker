FROM centos

RUN useradd -m -s /bin/bash docker
RUN echo "docker:docker" | chpasswd
RUN echo "root:root" | chpasswd
 
RUN yum install -y openssh-server
RUN /usr/bin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''

EXPOSE 22

RUN yum install -y mysql-server
RUN touch /etc/sysconfig/network
RUN /etc/init.d/mysqld start
VOLUME ["/var/lib/mysql", "/var/log"]

EXPOSE 3306

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

CMD ["/usr/local/bin/run"]
