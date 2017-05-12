node 'puppetmaster.example.com' {

  class { 'puppetserver::repository': } ->
	class { 'puppetserver':
	  config => {
	    'java_args'     => {
	      'xms'         => '256m',
	      'xmx'         => '512m',
	      'maxpermsize' => '256m',
	    },
	  },
	}

  class { '::puppetserver::hiera::eyaml':
      method  => 'gpg',
      require => Class['puppetserver::install'],
    }

    class { 'timezone':
      timezone => 'America/Toronto',
  }

  firewall { '100 allow puppet access':
    dport  => [8040],
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '101 allow http and https access':
    dport  => [80, 443],
    proto  => tcp,
    action => accept,
  }
  
   # Call fonctionne avec la valeur par défaut
  #include uqam::testtemplate
  #
  class {'::uqam::testtemplate':
    test_param => 'Hello, Hello world :)',
  }

  # Configure puppetdb and its underlying database
  # class { 'puppetdb': 
  #	listen_address => '10.11.12.51',
  #	ssl_listen_address  => '10.11.12.51',
  # }
  # Configure the Puppet master to use puppetdb
  # class { 'puppetdb::master::config': }


  # class {'uqam::iptables':
  # 	httpd_ports => '8080, 8081'
  # }

/*
  service { 'iptables':
      ensure => running,
      enable => true,
      hasrestart => true,
      subscribe => Exec['uqam::iptables.iptables', 'uqam::iptables.puppetport'],
  }
  */
}
