#!/usr/bin/env bash
#

# Let's use names instead of IPs.  Add that info to /etc/hosts
cp /etc/hosts{,.orig} 
cat /vagrant/extras/hosts >> /etc/hosts

rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm &> /dev/null
yum -y install puppet-agent &> /dev/null
cp /vagrant/puppet/puppet.conf /etc/puppetlabs/puppet/puppet.conf
mkdir -p /etc/puppetlabs/puppet/ssl/{public,private}_keys/
myname=$( uname -n )
#cp /vagrant/puppet/keys/public_keys/${myname}.pem /etc/puppetlabs/puppet/ssl/public_keys/
#cp /vagrant/puppet/keys/private_keys/${myname}.pem /etc/puppetlabs/puppet/ssl/private_keys/
echo ${myname}