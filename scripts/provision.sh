#!/usr/bin/env bash
#


# Let's use names instead of IPs.  Add that info to /etc/hosts
cp /etc/hosts{,.orig} 
cat /vagrant/extras/hosts >> /etc/hosts

echo "Installing puppet..."
rpm -Uh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm &> /dev/null
yum install -y puppetserver &> /dev/null

# It is easier to have puppet in the path like that.
ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet

#echo "Modifing puppetserver start params..."
sed -i -e "s%2g%512m%g" /etc/sysconfig/puppetserver
options='--modulepath="/etc/puppetlabs/code/environments/temp/modules"'
puppet module install camptocamp-puppetserver ${options}
puppet module install puppetlabs-puppetdb ${options}

cat /vagrant/puppet/puppet.conf >> /etc/puppetlabs/puppet/puppet.conf

echo "Installing goodies ..."
yum install -y tree lsof  &> /dev/null

echo "Setting puppetserver start on boot ..."
systemctl enable puppetserver &> /dev/null
systemctl start puppetserver &> /dev/null
#
# This is not safe :) but its easier. Do not take the risk
systemctl disable iptables
