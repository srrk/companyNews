# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "dynapp" do |dynapp|
    dynapp.vm.box="ubuntu/xenial64"
    dynapp.vm.hostname = "dynapp"
    dynapp.vm.network "private_network", ip: "192.168.33.88"
    dynapp.vm.network "forwarded_port", guest: 8080, host: 9090
    dynapp.vm.network "forwarded_port", guest: 8443, host: 9443
    dynapp.vm.provision :shell, path: "bootstrap.sh"
  end

  config.vm.define "static" do |static|
    static.vm.box="ubuntu/xenial64"
    static.vm.hostname = "static"
    static.vm.network "private_network", ip: "192.168.33.99"
    static.vm.network "forwarded_port", guest: 8080, host: 7070
    static.vm.network "forwarded_port", guest: 8443, host: 7443
    static.vm.provision :shell, path: "bootstrap-static.sh"
  end

  config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 1
  end

end