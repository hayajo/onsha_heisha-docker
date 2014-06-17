Docker入門
==========

Dockerでﾜｲﾜｲ


環境構築
--------

### 環境

* [Vagrant](http://www.vagrantup.com/downloads.html) >= 1.6.3
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) >= 4.3.10

### 前準備

boxのダウンロードと環境の準備が実行されるために時間がかかります。

    $ vagrant up && vagrant halt


Docker基礎
----------

[Docker入門 (全11回) - プログラミングならドットインストール](http://dotinstall.com/lessons/basic_docker)


### sshd

sshで接続できるようにしてみよう

    $ cd /vagrant/httpd
    $ docker build -t onsha_heisha/httpd .
    $ docker run --name=httpd -d onsha_heisha/httpd
    $ curl `docker inspect --format '{{ .NetworkSettings.IPAddress }}' httpd`
    $ ssh docker@`docker inspect --format '{{ .NetworkSettings.IPAddress }}' httpd`

