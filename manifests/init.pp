class koticonf {

       
	exec { 'apt-update':

       	command => '/usr/bin/apt-get update'

       	}

       	package { 'apache2':

       	require => Exec['apt-update'],

       	ensure => installed,

       	allowcdrom => true,

       	}

       	service { 'apache2':

       	ensure => running,

       	}

       	package { 'mysql-server':

       	require => Package['apache2'],

       	ensure => installed,

       	allowcdrom => true,

       	}

       	package { 'mysql-client':

       	require => Package['mysql-server'],

       	ensure => installed,

       	allowcdrom => true,

       	}

	service { 'mysql':

      	ensure => running,

      	provider => systemd,

      	require => Package['mysql-server'],

      	}

      	package { 'php':

      	require => Package['mysql-server'],

      	ensure => installed,

      	allowcdrom => true,

      	}

      	package { 'libapache2-mod-php':

      	require => Package['php'],

      	ensure => installed,

      	allowcdrom => true,

      	}

      	package { 'php-mysql':

      	require => Package['libapache2-mod-php'],

      	ensure => installed,

      	allowcdrom => true,

      	}

      	package { 'ssh':

      	require => Exec['apt-update'],

      	ensure => installed,

      	allowcdrom => true,

      	}

      	service { 'ssh':

      	ensure => 'running',

      	provider => 'systemd',

      	}     

      	file { '/etc/ssh/sshd_config':

      	content => template('koticonf/sshd_config'),

      	notify => Service['ssh'],

      	}
	
	host { 'redtapeforbots.com':
		
	ip => '127.0.0.1',
		
	host_aliases => 'RedTapeForBots.com',
	
	}
	
	file { '/var/www/html/index.html':
		
	content => template('koticonf/index.html'),
	
	require => Package['apache2'],

	}	

	file { '/etc/ufw/user.rules':
	
	content => template('koticonf/user.rules'),	
	
	}

	file { '/etc/ufw/user6.rules':

	content => template('koticonf/user6.rules'),

	}

	exec { 'ufw enable':

	path =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],

	}
}
