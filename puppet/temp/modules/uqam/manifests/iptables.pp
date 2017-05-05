class uqam::iptables (String $httpd_ports = ''){

	exec { 'iptables':
      command => "iptables -I INPUT 1 -p tcp -m multiport --ports ${httpd_ports} -m comment --comment 'Custom HTTP Web Host' -j ACCEPT && iptables-save > /etc/sysconfig/iptables",
      path => "/sbin",
      refreshonly => true,
    }

    exec { 'puppetport':
      command => "iptables -I INPUT -p tcp -m tcp --dport 8140 -m comment --comment 'Puppet port' -j ACCEPT && iptables-save > /etc/sysconfig/iptables",
      path => "/sbin",
      refreshonly => true,
    }
}