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
  # Configure puppetdb and its underlying database
  class { 'puppetdb': 
  	listen_address => '10.11.12.51'
  }
  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config': }
}
