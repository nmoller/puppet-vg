class uqam::testtemplate ($test_param = "World"){
	
	file{'/tmp/NMTest':
		ensure => file,
		content => template('uqam/myfile.txt.erb'),

	}
}