class tomcatidalia {
    notify { 'hello, tomcatidalia trying to be installed': }
  
	Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }
  
	package { "tomcat":
    		ensure => "installed",
  	}
  
  	service { "tomcat":
        	enable => true,
	        require => [ 
          	Package["tomcat"]],
	          ensure => running,
  	}

    	file { '/var/lib/tomcat/webapps/ROOT/index.html':
    		owner  => 'root',
    		group  => 'tomcat',
    		mode    => '0644',
    		content => "hello, world!\n",
		require => [Service["tomcat"]],
    	}


	notify { 'hello, tomcatidalia hopefully tomcat7 is installed': }
}
