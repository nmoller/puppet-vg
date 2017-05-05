#!/usr/bin/env bash
#

# Let's use names instead of IPs.  Add that info to /etc/hosts
cp /etc/hosts{,.orig} 
cat /vagrant/extras/hosts >> /etc/hosts

rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm &> /dev/null
yum -y install puppet-agent &> /dev/null

# It is easier to have puppet in the path like that.
ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet

cp /vagrant/puppet/puppet.conf /etc/puppetlabs/puppet/puppet.conf
mkdir -p /etc/puppetlabs/puppet/ssl/{public,private}_keys/
myname=$( uname -n )
cp /vagrant/puppet/keys/public_keys/${myname}.pem /etc/puppetlabs/puppet/ssl/public_keys/
cp /vagrant/puppet/keys/private_keys/${myname}.pem /etc/puppetlabs/puppet/ssl/private_keys/

# It will generate the certificate in the master, ready to be signed
puppet agent -t  --environment=temp

echo "${myname} is ready"