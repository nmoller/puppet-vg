#!/usr/bin/env bash

echo "Installing puppet..."
rpm -Uh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm &> /dev/null
yum install -y puppetserver &> /dev/null

# It is easier to have puppet in the path like that.
ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet

echo "Modifing puppetserver start params..."
sed -i -e "s%2g%512m%g" /etc/sysconfig/puppetserver
echo '[agent]' >> /etc/puppetlabs/puppet/puppet.conf
echo 'server=puppetmaster.example.com' >> /etc/puppetlabs/puppet/puppet.conf

echo "Installing goodies ..."
yum install -y tree lsof  &> /dev/null
