FROM centos

RUN useradd -m -s /bin/bash docker
RUN echo "docker:docker" | chpasswd
RUN echo "root:root" | chpasswd
 
RUN yum install -y openssh-server
RUN /usr/bin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''

EXPOSE 22

RUN rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
RUN yum install -y nginx perl
ADD default /etc/nginx/conf.d/default.conf
VOLUME ["/var/log/nginx"]

EXPOSE 80

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

CMD ["/usr/local/bin/run"]
