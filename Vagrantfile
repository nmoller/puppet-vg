# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.define "master" do |master|
    master.vm.box = "bento/centos-7.2"
    master.vm.hostname = "puppetmaster.example.com"
    master.vm.network :private_network, ip: "10.11.12.51"
    master.vm.network :private_network, ip: "192.168.12.51", virtualbox__intnet: true
    master.vm.box_check_update = false
    master.vm.provision :shell, path: "scripts/provision.sh"
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
end
