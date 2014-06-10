# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :docker do |d|
  end

  config.vm.provision :shell, inline: <<-SCRIPT
    cd /vagrant
    gunzip -c centos-6.4.tar.gz | docker import - centos
  SCRIPT
end
