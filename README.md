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


Docker実践
----------

みんな大(好き|嫌い)ワードプレスでﾜｲﾜｲ


```
localhost(8080) ----- Nginx(lb:80) --+-- WordPress(app1:80) --+-- MySQL(db:3306)
                                     |                        |
                                     +-- WordPress(app2:80) --+
```

1. db

        $ cd /vagrant/db
        $ docker build -t onsha_heisha/db .
        $ docker run --name=db -d onsha_heisha/db

2. app

        $ cd /vagrant/app
        $ docker build -t onsha_heisha/app .
        $ docker run --name=app1 --link=db:db -d onsha_heisha/app
        $ docker run --name=app2 --link=db:db -d onsha_heisha/app

3. lb

        $ cd /vagrant/lb
        $ docker build -t onsha_heisha/lb .
        $ docker run -d --name=lb --link=app1:app1 --link=app2:app2 -p 80:80 onsha_heisha/lb


補足
----

 - [Vagrant + Docker + Serf のサンプル](https://bitbucket.org/hayajo/sample-vagrant-docker_provider)
