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

    # We need to decrease the puppetserver starting options
    master.vm.provision "shell", inline: <<-SHELL
      echo "Installing puppet..."
      rpm -Uh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm &> /dev/null
      yum install -y puppetserver &> /dev/null
      echo "Modifing puppetserver start params..."
      sed -i -e "s%2g%512m%g" /etc/sysconfig/puppetserver
      echo "Installing goodies ..."
      yum install -y tree lsof  &> /dev/null
   SHELL
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
end
