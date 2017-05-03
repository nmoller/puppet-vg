# -*- mode: ruby -*-
# vi: set ft=ruby :

ourdomain="example.com"
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.define "master" do |master|
    master.vm.box = "bento/centos-7.2"
    master.vm.hostname = "puppetmaster.#{ourdomain}"
    master.vm.network :private_network, ip: "10.11.12.51"
    #master.vm.network "forwarded_port", guest: 8080, host: 8080 # HTTP
    master.vm.synced_folder "puppet/temp", "/etc/puppetlabs/code/environments/temp"
    master.vm.box_check_update = false
    master.vm.provision :shell, path: "scripts/provision.sh"
  end

  config.vm.define "slave01" do |slave01|
    slave01.vm.box = "bento/centos-6.7"
    slave01.vm.hostname = "slave01.#{ourdomain}"
    slave01.vm.network :private_network, ip: "10.11.12.52"
    slave01.vm.box_check_update = false
    slave01.vm.provision :shell, path: "scripts/slave.sh"
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
end
